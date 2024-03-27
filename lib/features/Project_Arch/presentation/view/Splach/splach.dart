import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_cubit/features/Project_Arch/presentation/Cubits/Auth_cubit/auth_cubit.dart';
import 'package:note_app_with_cubit/features/Project_Arch/presentation/view/login/login.dart';
import 'package:note_app_with_cubit/features/Project_Arch/presentation/view/signup/signup.dart';

import '../../../../../core/Methods/methods.dart';
import 'Widgets/widgets.dart';

class Startscreen extends StatelessWidget {
  const Startscreen({super.key});

  Widget build(BuildContext context) {
    DelaySplachScreen(context);
    return Scaffold(
      body: BodyStartscreen(),
    );
  }
}
