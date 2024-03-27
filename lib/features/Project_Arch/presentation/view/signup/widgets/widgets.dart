import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app_with_cubit/core/utils/Assets.dart';
import 'package:note_app_with_cubit/core/components/Bacground.dart';
import 'package:note_app_with_cubit/core/components/C_btn.dart';
import 'package:note_app_with_cubit/core/components/C_textfield.dart';
import 'package:note_app_with_cubit/core/components/Loader.dart';
import 'package:note_app_with_cubit/features/Project_Arch/presentation/Cubits/Auth_cubit/auth_cubit.dart';
import 'package:note_app_with_cubit/features/Project_Arch/presentation/view/login/login.dart';

import '../../../Cubits_controller/controllers.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(children: [
          Opacity(opacity: 0.5, child: BackGroundPTT()),
          Column(
            children: [
              logo_Auth(),
              // SizedBox(height: 35.h),
              Auth_Section(),
            ],
          ),
          Auth_Contrller(context).isloading ? Loader() : Text("")
        ]);
      },
    );
  }
}

class logo_Auth extends StatelessWidget {
  const logo_Auth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50.h),
          SvgPicture.asset(Asset_App.Logo),
          SizedBox(height: 12.h),
          Text(
            "TrendyBuy",
            style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.9.w),
          )
        ],
      ),
    );
  }
}

class Auth_Section extends StatefulWidget {
  Auth_Section({
    super.key,
  });

  @override
  State<Auth_Section> createState() => _Auth_SectionState();
}

class _Auth_SectionState extends State<Auth_Section> {
  GlobalKey<FormState> _LoginFormKey = GlobalKey();

  TextEditingController UsernasmeController = TextEditingController();

  TextEditingController PasswordController = TextEditingController();
  TextEditingController re_PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Form(
        key: _LoginFormKey,
        child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(children: [
                SizedBox(
                  height: 41.h,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          fontSize: 28.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  width: 356.w,
                  height: 40.h,
                ),
                Column(
                  children: [
                    C_TextField(
                      ValidetorText: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a Email';
                        }
                        return ""; // Return null if the value is not empty
                      },
                      ControllerText: UsernasmeController,
                      hinttext: "www.exmaple@gmail.com",
                      LabelText: " Email",
                      is_secure: false,
                      suffixIcon: Icon(Icons.person),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    C_TextField(
                      ValidetorText: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a Password';
                        }
                        return ""; // Return null if the value is not empty
                      },
                      ControllerText: PasswordController,
                      hinttext: "..............",
                      LabelText: " Password",
                      is_secure: true,
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    C_TextField(
                      ValidetorText: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a Email';
                        }
                        return ""; // Return null if the value is not empty
                      },
                      ControllerText: re_PasswordController,
                      hinttext: ".............",
                      LabelText: " Re_password",
                      is_secure: true,
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    C_BTN(
                      TextBtn: "SIGN UP",
                      onTap: () => _saveForm(),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  Loginscreen(),
                          transitionDuration: Duration(seconds: 1),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0, 40);
                            const end = Offset.zero;
                            const curve = Curves.easeInOut;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);
                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      ),
                      child: Text(
                        "LOG IN",
                        style: TextStyle(
                            fontSize: 19.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            width: MediaQuery.of(context).size.width,
            height: 484.h,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: Offset(0, -8),
                    blurRadius: 25,
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white)),
      ),
    );
  }

  _saveForm() {
    if (UsernasmeController.text.isNotEmpty &&
        PasswordController.text.isNotEmpty) {
      Auth_Contrller(context).SignFromController(UsernasmeController.text,
          PasswordController.text, re_PasswordController.text, context);

      _LoginFormKey.currentState!.save();

      print('Form saved!' + UsernasmeController.text);
    } else {
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: const Color.fromARGB(255, 255, 93, 82),
            content: Text("No Info found")));
      }
    }
    // }
  }
}
