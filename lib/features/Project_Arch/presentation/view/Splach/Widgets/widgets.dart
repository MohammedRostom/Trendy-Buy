import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app_with_cubit/core/utils/Assets.dart';

import '../../../../../../core/components/Bacground.dart';

class BodyStartscreen extends StatelessWidget {
  const BodyStartscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          BackGroundPTT(),
          FrontSpelchScreen(),
        ],
      ),
    );
  }
}

class FrontSpelchScreen extends StatelessWidget {
  const FrontSpelchScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 428.w,
          height: 656.h,
          child: Padding(
            padding: const EdgeInsets.all(150),
            child: SvgPicture.asset(
              Asset_App.Logo,
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Opacity(opacity: 0.4, child: Text("TrendyBuy"))
      ],
    );
  }
}
