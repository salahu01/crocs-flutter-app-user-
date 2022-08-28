import 'package:crocs/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends AppColors {
  const CustomTextField({Key? key, required this.label,this.validation,this.controller}) : super(key: key);
  final String label;
  final VoidCallback? validation;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Text(
            '$label : ',
            style: TextStyle(
                color: primary, fontSize: 14.sp, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 43.h,
          width: size.width * 0.9,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 10.r,
              ),
              enabled: true,
              alignLabelWithHint: true,
              hintText: 'Enter $label here ...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: primary, width: 1.sp),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: primary, width: 1.sp),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.red, width: 1.sp),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: primary, width: 1.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
