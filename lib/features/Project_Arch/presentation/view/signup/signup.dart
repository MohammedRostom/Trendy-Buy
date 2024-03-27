import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SignupBody(),
    );
  }
}
