import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app_with_cubit/features/Project_Arch/data/repositories_impl/User_rebo.dart';
import 'package:note_app_with_cubit/features/Project_Arch/presentation/view/login/login.dart';
import '../../../../../core/Methods/methods.dart';
import '../../../../../core/utils/Strings.dart';
import '../../view/home/home.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  var username = "";
  var Token = "";
  bool isloading = false;
  Future<void> LoginFromController(Username, pass, context) async {
    isloading = true;
    emit(Logindone());
    var user = await UserRepo.login(
      context: context,
      emailfromfiled: Username,
      passfromFielf: pass,
    );

    if (user != null &&
        user != MsgsfromApiRespons.msg1 &&
        user.containsValue("success")) {
      username = Username;
      Token = user["token"];
      print(user);
      isloading = false;
      LoginORSignupDoneMetthod(
        ismove: true,
        context,
        content: "Login Successfully",
        widget: homescreen(),
      );
      emit(Logindone());
    } else {
      isloading = false;
      LoginORSignupDoneMetthod(context,
          ismove: false,
          content: MsgsfromApiRespons.msg1,
          widget: Text(""),
          color: Colors.red);
      emit(Logindone());
    }
  }

  Future<void> SignFromController(Username, pass, repass, context) async {
    isloading = true;
    emit(LoginLoading());
    var user = await UserRepo.signUp(
      context: context,
      emailfromfiled: Username,
      passfromFielf: pass,
      RpassfromFielf: repass,
    );
    if (user == MsgsfromApiRespons.msgErrorBass) {
      isloading = false;
      LoginORSignupDoneMetthod(context,
          ismove: false,
          content: MsgsfromApiRespons.con_msgErrorBass,
          widget: Loginscreen(),
          color: Colors.red);
      emit(Logindone());
    } else if (user == MsgsfromApiRespons.msgUnValidEmail) {
      isloading = false;
      LoginORSignupDoneMetthod(context,
          ismove: false,
          content: MsgsfromApiRespons.con_msgUnValidEmail,
          widget: Loginscreen(),
          color: Colors.red);
      emit(Logindone());
    } else if (user == MsgsfromApiRespons.msglenPass8) {
      isloading = false;
      LoginORSignupDoneMetthod(context,
          ismove: false,
          content: MsgsfromApiRespons.con_msglenPass8,
          widget: Loginscreen(),
          color: Colors.red);
      emit(Logindone());
    } else if (user == MsgsfromApiRespons.msgUnValidEmailLenPass8) {
      isloading = false;
      LoginORSignupDoneMetthod(context,
          ismove: false,
          content: MsgsfromApiRespons.con_msgUnValidEmailLenPass8,
          widget: Loginscreen(),
          color: Colors.red);
      emit(Logindone());
    } else if (user != null && (user as Map).containsValue("success")) {
      print(user);
      isloading = false;
      LoginORSignupDoneMetthod(context,
          content: "Registerd Successfully",
          widget: Loginscreen(),
          ismove: true);
      emit(Logindone());
    }
  }
}
