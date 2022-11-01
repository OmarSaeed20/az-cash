class UserModel {
  String? uid;
  String? phoneNumber;
  String? walletNumber;
  List<dynamic>? numbers;
  String? imageFrontIdCard;
  String? imageBackIdCard;
  String? imageUser;
  String? nationalIdNumber;
  String? name;
  String? nameFamily;
  String? governorate;
  String? state;
  String? address;
  String? emailAddress;
  String? birthday;
  String? releaseDate;
  String? expiryDate;
  String? maritalStatus;
  String? gender;
  String? educationStatus;
  String? numberChildren;
  String? walletType;
  String? workType;
  String? workNature;
  String? workingPeriod;
  String? income;
  List<dynamic>? emergency = [];

  UserModel({
    this.phoneNumber,
    this.walletNumber,
    this.uid,
    this.numbers,
    this.imageFrontIdCard,
    this.imageBackIdCard,
    this.imageUser,
    this.nationalIdNumber,
    this.name,
    this.nameFamily,
    this.governorate,
    this.state,
    this.address,
    this.emailAddress,
    this.birthday,
    this.releaseDate,
    this.expiryDate,
    this.maritalStatus,
    this.walletType,
    this.workType,
    this.workNature,
    this.workingPeriod,
    this.educationStatus,
    this.numberChildren,
    this.gender,
    this.income,
    this.emergency,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    walletNumber = json['wallet_number'];
    uid = json['uid'];
    numbers = json['available_funding'];
    imageFrontIdCard = json['image_front_id_card'];
    imageBackIdCard = json['image_back_id_card'];
    imageUser = json['image_user'];
    nationalIdNumber = json['national_id_number'];
    name = json['name'];
    nameFamily = json['name_family'];
    governorate = json['governorate'];
    state = json['state'];
    address = json['address'];
    emailAddress = json['email_address'];
    birthday = json['birthday'];
    releaseDate = json['release_date'];
    expiryDate = json['expir_date'];
    maritalStatus = json['marital_status'];
    walletType = json['wallet_type'];
    workType = json['work_type'];
    workNature = json['work_nature'];
    workingPeriod = json['working_period'];
    educationStatus = json['education_status'];
    numberChildren = json['number_children'];
    gender = json['gender'];
    income = json['income'];
    for (var item in emergency!) {
      json['emergency'].add(item.nameContact);
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'phone_number': phoneNumber,
      'wallet_number': walletNumber,
      'uid': uid,
      'available_funding': numbers,
      'image_front_id_card': imageFrontIdCard,
      'image_back_id_card': imageBackIdCard,
      'image_user': imageUser,
      'national_id_number': nationalIdNumber,
      'name': name,
      'name_family': nameFamily,
      'governorate': governorate,
      'state': state,
      'address': address,
      'email_address': emailAddress,
      'birthday': birthday,
      'release_date': releaseDate,
      'expiry_date': expiryDate,
      'marital_status': maritalStatus,
      'wallet_type': walletType,
      'work_type': workType,
      'work_nature': workNature,
      'working_period': workingPeriod,
      'education_status': educationStatus,
      'number_children': numberChildren,
      'gender': gender,
      'income': income,
      'emergency': emergency!.map((item) => item.toMap()).toList(),
    };
  }
}

class Emergency {
  String? nameContact;
  String? phone;
  String? relation;

  Emergency({
    this.nameContact,
    this.phone,
    this.relation,
  });

  Emergency.fromJson(Map<String, dynamic> json) {
    nameContact = json['name_contact'];
    phone = json['phone'];
    relation = json['relation'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name_contact': nameContact,
      'phone': phone,
      'relation': relation,
    };
  }
}
