import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LoginBody(),
    );
  }
}
