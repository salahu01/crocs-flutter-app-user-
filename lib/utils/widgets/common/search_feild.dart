import 'package:crocs/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends AppColors {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: TextField(
        cursorColor: primary,
        cursorHeight: 20.sp,
        style: TextStyle(
            letterSpacing: 0.4.sp,
            color: primary,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600),
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: primary,
              size: 22.sp,
            ),
            filled: true,
            fillColor: Colors.grey.shade300,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
