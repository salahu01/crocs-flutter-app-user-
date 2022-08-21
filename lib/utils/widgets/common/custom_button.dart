import 'package:crocs/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends AppColors {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: size.width * 0.17,
          right: size.width * 0.17,
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
                'Add To Cart',
                style: TextStyle(
                    color: light, fontWeight: FontWeight.w700, fontSize: 23.sp),
              ),
              const Spacer(),
              Icon(
                Icons.shopping_bag,
                color: light,
                size: 25.sp,
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
