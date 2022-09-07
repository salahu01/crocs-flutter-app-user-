import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeButton extends AppColors {
  const SizeButton({
    Key? key,
    required this.onTap,
    required this.backgroundColor,
    required this.text,
    required this.textColor,
  }) : super(key: key);
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: primary, width: 2.r),
            color: backgroundColor),
        child: SizedBox(
          height: 40.sp,
          width: 40.sp,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
