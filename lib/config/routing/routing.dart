import 'package:flutter/material.dart';
import 'package:note_app_with_cubit/features/Project_Arch/presentation/view/home/home.dart';
import 'package:note_app_with_cubit/features/Project_Arch/presentation/view/login/login.dart';
import '../../features/Project_Arch/presentation/view/Search/searchscreen.dart';
import '../../features/Project_Arch/presentation/view/Splach/splach.dart';
import '../../features/Project_Arch/presentation/view/addProduct/AddProductScreen.dart';
import '../../features/Project_Arch/presentation/view/signup/signup.dart';

class Routeing {
  static final start = "/";
  static final Login = "Login";
  static final sginup = "sginup";
  static final HomeS = "HomeS";
  static final Search = "search";
  static final AddProduct = "AddProduct";

  static Map<String, Widget Function(BuildContext)> MapOfAppRoutes = {
    start: (context) => Startscreen(),
    Login: (context) => Loginscreen(),
    sginup: (context) => Signupscreen(),
    HomeS: (context) => homescreen(),
    AddProduct: (context) => AddProductScreen(),
    Search: (context) => searchsecreen(),
  };
}
