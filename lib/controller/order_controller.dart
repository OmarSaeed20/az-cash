// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../helper/cache_helper.dart';
import '../models/order_model.dart';
import '../models/user_model.dart';
import '../view/screens/apply/apply_for_financing_screen.dart';
import '../view/screens/dashboard/dashboard_screen.dart';

class OrderController extends GetxController {
  // // onInit Method
  // @override
  // void onInit() {
  //   getOrdersData();
  //   super.onInit();
  // }

  // Orders
  List<Order> _orders = [];
  List<Order> get orders => _orders;
  Order? order;
  bool _isLoading = !true;
  bool get isLoading => _isLoading;

  // Images Id Card
  File? imageIdCardFront;
  File? imageIdCardBack;
  File? imageUser;

  // Emergency
  List<Emergency> emergencyList = [];
  Emergency? emergencyFirst;
  Emergency? emergencySecond;

  // Each Variables
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _nameContoller = TextEditingController();
  final TextEditingController _nameFamilyController = TextEditingController();
  final TextEditingController _governorateController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get nationalIdController => _nationalIdController;
  TextEditingController get nameContoller => _nameContoller;
  TextEditingController get nameFamilyController => _nameFamilyController;
  TextEditingController get governorateController => _governorateController;
  TextEditingController get stateController => _stateController;
  TextEditingController get addressController => _addressController;
  TextEditingController get emailController => _emailController;
  // User
  String? imageIdFrontUrl;
  String? imageIdBackUrl;
  String? imageUrl;
  String? birthday;
  String? releaseDate;
  String? expiryDate;
  String? maritalStatus;
  String? gender;
  String? statusEducation;
  String? numberChildren;
  // Work
  String? workType;
  String? workNature;
  String? workingPeriod;
  String? income;
  // Wallet
  String? walletType;
  final TextEditingController _walletNumberController = TextEditingController();
  TextEditingController get walletNumController => _walletNumberController;

  // change birthday value
  void changeBirthday(String val) {
    birthday = val;
    update();
  }

  // change release value
  void changeRelease(String val) {
    releaseDate = val;
    update();
  }

  // change expiry value
  void changeExpiry(String val) {
    expiryDate = val;
    update();
  }

  // change marital value
  void changeMarital(String val) {
    maritalStatus = val;
    update();
  }

  // change gender value
  void changeGender(String val) {
    gender = val;
    update();
  }

  // change education value
  void changeEducation(String val) {
    statusEducation = val;
    update();
  }

  // change children value
  void changeChildren(String val) {
    numberChildren = val;
    update();
  }

  // change type work value
  void changeTypeWork(String val) {
    workType = val;
    update();
  }

  // change work nature value
  void changeWorkNature(String val) {
    workNature = val;
    update();
  }

  // change work period value
  void changeWorkPeriod(String val) {
    workingPeriod = val;
    update();
  }

  // change income value
  void changeIncome(String val) {
    income = val;
    update();
  }

  // change wallet type value
  void changeWalletType(String val) {
    walletType = val;
    update();
  }

  // Method Get Image
  void getFileImage(File image, bool isCkeck) {
    if (isCkeck) {
      imageIdCardFront = image;
    } else {
      imageIdCardBack = image;
    }
    update();
  }

  // Emergency
  Future<void> openContacts(bool isCheck) async {
    Contact? contact = await FlutterContacts.openExternalPick();
    if (isCheck) {
      String phone = "";
      contact!.phones.map((e) {
        return phone = e.number.replaceAll(RegExp(r"\s+\b|\b\s"), "");
      }).toList();
      emergencyFirst = Emergency(
        nameContact: contact.displayName,
        phone: phone,
        relation: relationF,
      );
      emergencyList.add(emergencyFirst!);
    } else {
      String phone = "";
      contact!.phones.map((e) {
        return phone = e.number.replaceAll(RegExp(r"\s+\b|\b\s"), "");
      }).toList();
      emergencySecond = Emergency(
        nameContact: contact.displayName,
        phone: phone,
        relation: relationS,
      );
      emergencyList.add(emergencySecond!);
    }
    update();
  }

  // change relation first value
  String? relationF;
  void changeRelationFValue(String val) {
    relationF = val;
    update();
  }

  // change relation second value
  String? relationS;
  void changeRelationSValue(String val) {
    relationS = val;
    update();
  }

  // Method Upload User Data
  Future<void> uploadUserData(BuildContext context) async {
    try {
      _isLoading = true;
      update();
      UserModel userModel = UserModel(
        uid: auth.currentUser!.uid,
        phoneNumber: auth.currentUser!.phoneNumber,
        numbers: [100, 200, 300],
        address: _addressController.text,
        birthday: birthday,
        educationStatus: statusEducation,
        emailAddress: _emailController.text,
        expiryDate: expiryDate,
        gender: gender,
        governorate: _governorateController.text,
        imageFrontIdCard: imageIdFrontUrl,
        imageBackIdCard: imageIdBackUrl,
        imageUser: imageUrl,
        income: income,
        maritalStatus: maritalStatus,
        name: _nameContoller.text,
        nameFamily: _nameFamilyController.text,
        nationalIdNumber: _nationalIdController.text,
        numberChildren: numberChildren,
        walletNumber: _walletNumberController.text,
        releaseDate: releaseDate,
        state: _stateController.text,
        walletType: walletType,
        workingPeriod: workingPeriod,
        workNature: workNature,
        workType: workType,
        emergency: emergencyList,
      );
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .update(userModel.toMap());
      // Dialog dismiss
      Navigator.pop(context);
      // open new class
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ApplyForFinancingScreen(),
        ),
      );
      CacheHelper.saveData(key: "isUploaded", value: true);
      isUploaded = await CacheHelper.getData(key: "isUploaded");
      _isLoading = !true;
      update();
    } catch (error) {
      debugPrint("upload user data ======>  $error");
    }
  }

  // Method Get Url Images
  Future<void> getUrlImages(BuildContext context) async {
    try {
      if (imageIdCardFront != null &&
          imageIdCardBack != null &&
          imageUser != null) {
        imageIdFrontUrl = await uploadImages(imageIdCardFront);
        imageIdBackUrl = await uploadImages(imageIdCardBack);
        imageUrl = await uploadImages(imageUser);
        uploadUserData(context);
      }
    } catch (error) {
      debugPrint("get url images ======>  $error");
    }
  }

  // Method Upload Images
  Future<String> uploadImages(File? img) async {
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('images/${Uri.file(img!.path).pathSegments.last}');
    UploadTask uploadTask = reference.putFile(File(img.path));
    return await (await uploadTask).ref.getDownloadURL();
  }

  // Amount
  String? amount = "";
  void changeValue(String val) {
    amount = val;
    update();
  }

  // Get Fee
  double fee = 0.0;
  double getFee(String amount) {
    return fee = (double.parse(amount) / 100) * 42.5;
  }

  // Get Total Amount
  double totalAmount = 0.0;
  double getTotalAmount(String amount, double fee) {
    return totalAmount = double.parse(amount) + fee;
  }

  // Method Upload Order Data
  Future<void> uploadOrderData({
    required BuildContext context,
    required String timeFinancing,
    required UserModel model,
  }) async {
    try {
      _isLoading = true;
      update();
      int random = Random().nextInt(1000000);
      Order order = Order(
        id: "#$random",
        amountFunding: amount,
        serviceFee: fee.toString(),
        totalAmount: totalAmount.toString(),
        nationalIdNumber: model.nationalIdNumber ?? nationalIdController.text,
        walletNumber: model.walletNumber ?? walletNumController.text,
        timeFinancing: timeFinancing,
        paymentDate: "",
        orderStatus: "قيد المراجعة",
        isPay: "لم يسدد",
        periodLate: "0",
        feeLate: "0.0",
      );
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .collection("Orders")
          .doc("#$random")
          .set(order.toMap());
      // Get Orders Data
      getOrdersData();
      // Get Order Not Pay
      getOrderData();
      // Dialog dismiss
      Navigator.pop(context);
      //open new class
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => DashboradScreen(),
        ),
        (route) => !true,
      );
      _isLoading = !true;
      update();
    } catch (error) {
      debugPrint("upload order data ======>  $error");
    }
  }

  // Method Get Orders Data
  Future<void> getOrdersData() async {
    try {
      _isLoading = true;
      update();
      FirebaseFirestore.instance
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .collection("Orders")
          .snapshots()
          .listen((data) {
        _orders = [];
        for (var item in data.docs) {
          _orders.add(Order.fromJson(item.data()));
        }
        _isLoading = !true;
        update();
      });
    } catch (error) {
      debugPrint("get orders data ======>  $error");
    }
  }

  // Method Get Order Not Pay
  Future<void> getOrderData() async {
    try {
      _isLoading = true;
      update();
      FirebaseFirestore.instance
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .collection("Orders")
          .snapshots()
          .listen((data) {
        for (var item in data.docs) {
          if (item["is_pay"] == "لم يسدد") {
            order = Order.fromJson(item.data());
          }
        }
        _isLoading = !true;
        update();
      });
    } catch (error) {
      debugPrint("get order data ======>  $error");
    }
  }
}
