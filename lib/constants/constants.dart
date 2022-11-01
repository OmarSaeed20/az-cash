import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'size_config.dart';

// Check Variables
FirebaseAuth auth = FirebaseAuth.instance;
bool? isLogin;
bool? isPermission;
bool? isUploaded;
// index for array in picker
int currentIndex = 0;

// Icons
const String kIConDir = 'assets/icons/';
//SizedBox Height
final kHeightBox5 = SizedBox(height: getProportionateScreenHeight(5));
final kHeightBox10 = SizedBox(height: getProportionateScreenHeight(10));
final kHeightBox15 = SizedBox(height: getProportionateScreenHeight(15));
final kHeightBox20 = SizedBox(height: getProportionateScreenHeight(20));
final kHeightBox25 = SizedBox(height: getProportionateScreenHeight(25));
final kHeightBox30 = SizedBox(height: getProportionateScreenHeight(30));
final kHeightBox40 = SizedBox(height: getProportionateScreenHeight(40));
final kHeightBox60 = SizedBox(height: getProportionateScreenHeight(60));
final kHeightBox80 = SizedBox(height: getProportionateScreenHeight(80));

//SizedBox Width
final kWidthBox5 = SizedBox(width: getProportionateScreenHeight(5));
final kWidthBox10 = SizedBox(width: getProportionateScreenHeight(10));
final kWidthBox15 = SizedBox(width: getProportionateScreenHeight(15));
final kWidthBox20 = SizedBox(width: getProportionateScreenHeight(20));

// Instructions
List<String> instructions = [
  "لا قبعة",
  "لا قناع الوجه",
  "لا تتحرك بسرعة كبيرة",
  "حافظ علي مستوي الإضاءة الساطعة",
];
// Marital Status
List<String> statusMarital = ["اعزب", "متزوج/ة", "ارمل/ة", "مطلق/ة"];
// Gender
List<String> gender = ["ذكر", "انثى"];
List<String> workNature = [
  "عمل بدوام جزئي",
  "عمل بدوام كلى",
  "عاطل",
  "طالب",
  "عمل خاص",
  "اخرى",
];

/// Type Work
List<String> workType = [
  'سائق',
  'ناشر',
  'إدارة الائتمان',
  'مدير',
  'معلم',
  'نادل',
  'مدرب',
  'مدير مخازن',
  'سمسار',
  'باحث تنفيذى',
  'الشحن',
  'مربية اطفال',
  'الموارد البشرية',
  'أمين مخازن',
  'سائق أوبر',
  'التسويق والعلاقات العامة',
  'موظف امن',
  'خدمة العملاء',
  'الإدارة',
  'طبيب',
  'مذيع',
  'مهندس',
  'التطوير العقاري',
  'المبيعات',
  'صاحب متجر الكترونى',
  'اخرى',
];
// inCome
List<String> inCome = [
  "3000 : 5000 ج.م",
  "5000 : 8000 ج.م",
  "8000 : 10000 ج.م",
  "10000 : 15000 ج.م",
  "اكثر من 15000 ج.م",
];
// Time Work
List<String> workingPeriod = [
  "اقل من عام",
  "من عام الى ثلاث سنوات",
  "من ثلاث سنوات الى خمس سنوات",
  "اكثر من خمس سنوات",
];
// Number Children
List<String> numberChildren = [
  "0",
  "1",
  "2",
  "3",
  "اكثر من 3",
];

// Education Status
List<String> educationStatus = [
  'الابتدائية',
  'الاعدادية',
  'الثانوية',
  'بكالوريوس جامعى',
  'ماجيستير',
  'دكتوراه',
];
// Networks type
List<String> networks = [
  "فودافون كاش",
  "اوارنج كاش",
  "اتصالات كاش",
  "وي كاش",
];

// Relation First && Second
List<String> relationFirst = [
  "الاب",
  "الام",
  "الزوج / الزوجة",
  "الاخت",
  "الاخ",
];
List<String> relationSecond = [
  "الاب",
  "الام",
  "الزوج / الزوجة",
  "الاخت",
  "الاخ",
  "صديق",
  "زميل عمل",
];
// Contact Us
const String whatsApp = "01061075996";
const String customerServices = "01061075996";
const String email = "mHosny009@gmail.com";
