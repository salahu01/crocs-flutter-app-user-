import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/app_colors.dart';

class AuthDialog extends AppColors {
  const AuthDialog({required this.dialog,required this.title, this.onTap,Key? key}) : super(key: key);
  final String dialog;
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      child: RichText(
        text: TextSpan(
          text: dialog,
          style: TextStyle(
              color: Colors.black54,
              fontSize: 17.sp),
          children: <TextSpan>[
            TextSpan(
              text: ' / ',
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700),
            ),
            TextSpan(
              text: title,
              style: TextStyle(
                  color: primary,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}