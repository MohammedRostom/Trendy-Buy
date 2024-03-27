import 'package:flutter/material.dart';

class C_Text extends StatelessWidget {
  C_Text({
    super.key,
    required this.Y_Text,
    required this.FontSize,
    @required this.FontColor,
    @required this.Bold,
  });
  final String Y_Text;
  final double FontSize;
  final Color? FontColor;
  final Bold;
  @override
  Widget build(BuildContext context) {
    return Text(
      Y_Text,
      style: TextStyle(
          fontSize: FontSize,
          fontWeight: Bold ?? FontWeight.w500,
          color: FontColor ?? Colors.black),
    );
  }
}
