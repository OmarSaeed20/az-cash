// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants/constants.dart';
import '../helper/cache_helper.dart';
import '../helper/route_helper.dart';
import '../models/user_model.dart';
import '../view/screens/auth/verification_code_screen.dart';
import '../view/screens/dashboard/dashboard_screen.dart';
import '../view/widgets/custom_show_snack_bar.dart';
import 'dashboard_controller.dart';

class AuthController extends GetxController {
  // // onInit Method
  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  bool _isLoading = !true;
  bool get isLoading => _isLoading;
  String verificationId = '';
  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;
  String smsCode = '';
  bool _isLoaded = !true;
  bool get isLoaded => _isLoaded;
  UserModel? userModel;

  Future<void> phoneNumberSubmitted(BuildContext context) async {
    _isLoading = true;
    update();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+2 ${_phoneController.text}",
      timeout: const Duration(seconds: 60),
      verificationCompleted: verificationCompleted,
      verificationFailed: (FirebaseAuthException error) {
        Navigator.pop(context);
        customShowSnackBar(error.toString(), fontFamily: "OpenSans");
      },
      codeSent: (String verificationId, int? resendToken) async {
        this.verificationId = verificationId;
        // Dialog dismiss
        Navigator.pop(context);
        //open new class
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VerificationCodeScreen(phoneNumber: _phoneController.text),
          ),
          (route) => !true,
        );
        _isLoading = !true;
        update();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verificationCompleted(
    PhoneAuthCredential phoneAuthCredential,
  ) async {
    await signIn(phoneAuthCredential);
  }

  Future<void> smsCodeSubmitted(BuildContext context) async {
    _isLoading = true;
    update();
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await signIn(phoneAuthCredential).whenComplete(() {
      // Save User Data
      if (isUploaded != true) {
        saveUserData();
      }
      // Get User Data
      getUserData();
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
      // Cache Helper
      CacheHelper.saveData(key: "isLogin", value: true);
      _isLoading = !true;
      update();
    }).catchError((error) {
      Navigator.pop(context);
      customShowSnackBar(error.toString(), fontFamily: "OpenSans");
    });
  }

  // Method SignIn With Phone Number
  Future<void> signIn(PhoneAuthCredential phoneAuthCredential) async {
    await auth.signInWithCredential(phoneAuthCredential);
  }

  // Method Upload User Data
  Future<void> saveUserData() async {
    try {
      UserModel user = UserModel(
        uid: auth.currentUser!.uid,
        phoneNumber: auth.currentUser!.phoneNumber,
        numbers: [100, 200, 300],
        address: userModel!.address ?? "",
        birthday: userModel!.birthday ?? "",
        educationStatus: userModel!.educationStatus ?? "",
        emailAddress: userModel!.emailAddress ?? "",
        expiryDate: userModel!.expiryDate ?? "",
        gender: userModel!.gender ?? "",
        governorate: userModel!.governorate ?? "",
        imageFrontIdCard: userModel!.imageFrontIdCard ?? "",
        imageBackIdCard: userModel!.imageBackIdCard ?? "",
        income: userModel!.income ?? "",
        maritalStatus: userModel!.maritalStatus ?? "",
        name: userModel!.name ?? "",
        nameFamily: userModel!.nameFamily ?? "",
        nationalIdNumber: userModel!.nationalIdNumber ?? "",
        numberChildren: userModel!.numberChildren ?? "",
        walletNumber: userModel!.walletNumber ?? "",
        releaseDate: userModel!.releaseDate ?? "",
        imageUser: userModel!.imageUser ?? "",
        state: userModel!.state ?? "",
        walletType: userModel!.walletType ?? "",
        workingPeriod: userModel!.workingPeriod ?? "",
        workNature: userModel!.workNature ?? "",
        workType: userModel!.workType ?? "",
        emergency: userModel!.emergency ?? [],
      );
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(auth.currentUser!.uid)
          .set(user.toMap());
    } catch (error) {
      debugPrint("upload user data --------> $error");
    }
  }

  // Method Get User Data
  Future<void> getUserData() async {
    try {
      _isLoaded = true;
      update();
      FirebaseFirestore.instance
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .snapshots()
          .listen((val) {
        userModel = UserModel.fromJson(val.data()!);
        _isLoaded = !true;
        update();
      });
    } catch (error) {
      debugPrint("get user data --------> $error");
    }
  }

  // Method Sign Out
  Future<void> signOut() async {
    try {
      await auth.signOut();
      CacheHelper.removeData(key: "isLogin");
      Get.find<DashBoardController>().currentIndex = 0.obs;
      //open new class
      Get.offNamedUntil(RouteHelper.signIn, (route) => !true);
      update();
    } catch (error) {
      debugPrint("sign out --------> $error");
    }
  }

  // Permissions
  Future<void> getPermissions() async {
    Map<Permission, PermissionStatus> status = await [
      Permission.camera,
      Permission.contacts,
      Permission.phone,
      Permission.storage,
    ].request();

    if (status[Permission.camera.request()] ==
            status[Permission.camera.request().isGranted] &&
        status[Permission.contacts.request()] ==
            status[Permission.contacts.request().isGranted] &&
        status[Permission.phone.request().isGranted] ==
            status[Permission.phone.request().isGranted] &&
        status[Permission.storage.request()] ==
            status[Permission.storage.request().isGranted]) {
      CacheHelper.saveData(key: "isPermission", value: true).then((val) async {
        isPermission = val;
        isPermission = await CacheHelper.getData(key: "isPermission");
      });
      //  uploadContacts();
      update();
    } else {
      return;
    }
  }

  // Upload Contacts
  Future<void> uploadContacts() async {
    List<Contact> contacts = await FlutterContacts.getContacts();

    FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .collection("Contacts")
        .add({"conatct": contacts.map((item) => item).toList()});
    update();
  }
}
