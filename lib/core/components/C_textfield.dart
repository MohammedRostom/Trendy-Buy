import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class C_TextField extends StatelessWidget {
  const C_TextField({
    super.key,
    required this.hinttext,
    required this.LabelText,
    @required this.is_secure,
    @required this.ControllerText,
    @required this.suffixIcon,
    @required this.ValidetorText,
    @required this.onFieldSubmitted,
    @required this.FoucNode,
    @required this.keyboardType,
    @required this.maxdigit,
  });
  final hinttext;
  final LabelText;
  final is_secure;
  final ControllerText;
  final String Function(String?)? ValidetorText;
  final Function(String?)? onFieldSubmitted;
  final suffixIcon;
  final FoucNode;
  final keyboardType;
  final maxdigit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LabelText,
          style: TextStyle(fontSize: 14.sp),
        ),
        SizedBox(
          height: 6.h,
        ),
        Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: TextFormField(
                  maxLength: maxdigit ?? null,
                  keyboardType: keyboardType ?? TextInputType.text,
                  focusNode: FoucNode,
                  onFieldSubmitted: onFieldSubmitted ?? null,
                  controller: ControllerText,
                  cursorOpacityAnimates: true,
                  validator: ValidetorText,
                  obscureText: is_secure ?? false,
                  decoration: InputDecoration(
                      suffixIcon: suffixIcon ?? null,
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      hintText: hinttext,
                      hintStyle:
                          TextStyle(color: Colors.grey.withOpacity(0.7)))),
            ),
            width: 356.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0x5ed9d9d9))),
      ],
    );
  }
}
