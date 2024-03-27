import 'package:flutter/material.dart';
import 'package:note_app_with_cubit/core/utils/Assets.dart';

class BackGroundPTT extends StatelessWidget {
  const BackGroundPTT({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Container(
        child: Image.asset("${Asset_App.Background}"),
      ),
    );
  }
}
