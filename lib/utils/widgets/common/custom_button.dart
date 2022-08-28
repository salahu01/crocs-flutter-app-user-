import 'package:crocs/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends AppColors {
  const CustomButton({Key? key,required this.onTap,required this.dialog,required this.icon,required this.width}) : super(key: key);
  final VoidCallback onTap;
  final double width;
  final String dialog;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(
            left: size.width * width,
            right: size.width * width,
            bottom: size.height * 0.02,
          ),
          decoration: BoxDecoration(
              color: primary, borderRadius: BorderRadius.circular(20.sp)),
          height: size.height * 0.08,
          child: SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                const Spacer(flex: 2),
                Text(
                  dialog,
                  style: TextStyle(
                      color: light, fontWeight: FontWeight.w700, fontSize: 23.sp),
                ),
                const Spacer(),
                Icon(
                  icon,
                  color: light,
                  size: 25.sp,
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
