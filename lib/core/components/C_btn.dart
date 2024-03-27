import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class C_BTN extends StatelessWidget {
  const C_BTN({
    super.key,
    required this.TextBtn,
    required this.onTap,
    this.SizeText,
  });

  final TextBtn;
  final SizeText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          child: Text(
            TextBtn,
            style: TextStyle(fontSize: SizeText ?? 22.sp, color: Colors.white),
          ),
          width: 356.h,
          height: 50.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff40a3ff))),
    );
  }
}
