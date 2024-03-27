import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app_with_cubit/features/Project_Arch/data/data_sources/remote/firebases_servises/Firebase_Auth.dart';
import 'package:note_app_with_cubit/features/Project_Arch/data/models/usermodel.dart';

import '../data_sources/remote/Api/ApiServises.dart';

class UserRepo {
  static Future<dynamic> signUp(
      {emailfromfiled, passfromFielf, RpassfromFielf, context}) async {
    UserModel newuser = UserModel(
        email: emailfromfiled,
        password: passfromFielf,
        passwordConfirm: RpassfromFielf);

    var token = await GetDataFromApi().adduser(newuser, "signup");

    if (token != null) {
      print(token);
      return await token;
    }
  }

  static Future<dynamic> login({emailfromfiled, passfromFielf, context}) async {
    UserModel newuser = UserModel(
      email: emailfromfiled,
      password: passfromFielf,
    );

    var Token = await GetDataFromApi().adduser(newuser, "login");
    if (Token != null) {
      print(Token);
      return await Token;
    }
  }
}
