import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NetorkErrorWidget extends AppColors {
  const NetorkErrorWidget({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text(
            text: 'Connection refused !',
            fontWeight: FontWeight.w800,
            size: 17.sp,
          ),
          SizedBox(height: 10.h),
          TextButton.icon(
            onPressed: onTap,
            icon: Icon(
              Icons.restore,
              color: light,
              size: 20.sp,
            ),
            label: text(
                text: 'Retry',
                color: light,
                size: 20.sp,
                fontWeight: FontWeight.w700),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(primary),
            ),
          ),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }

  Widget text(
          {required String text,
          Color? color,
          double? size,
          FontWeight? fontWeight}) =>
      Text(
        text,
        style: TextStyle(
          color: color ?? primary,
          fontSize: size ?? 20.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
      );
}
