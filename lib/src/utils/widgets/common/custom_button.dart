import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends AppColors {
  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.dialog,
      this.icon,
      this.width,
      this.height})
      : super(key: key);
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final String dialog;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: primary, borderRadius: BorderRadius.circular(20.sp)),
        child: SizedBox(
          width: width ?? size.height * 0.08,
          height: height ?? size.height * 0.08,
          child: Row(
            children: [
              const Spacer(flex: 2),
              Text(
                dialog,
                style: TextStyle(
                    color: light, fontWeight: FontWeight.w700, fontSize: 20.sp),
              ),
              const Spacer(),
              Visibility(
                visible: icon != null,
                child: Icon(
                  icon,
                  color: light,
                  size: 30.sp,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
