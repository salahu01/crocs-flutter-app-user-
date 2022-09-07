import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends AppColors {
  CustomTextField(
      {Key? key, required this.label,required this.icon, this.validation, this.controller})
      : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final String label;
  final IconData icon;
  final VoidCallback? validation;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 75.h,
      width: size.width * 0.9,
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 10.r,
            ),
            prefixIcon: Icon(
              icon,
              color: primary,
              size: 23.sp,
            ),
            enabled: true,
            alignLabelWithHint: true,
            hintText: 'Enter $label',
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
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Please enter some text';
            } else if (label == 'email') {
              return !text.contains('@gmail.com')
                  ? 'Please enter valid $label'
                  : null;
            } else if (label == 'password' || label == 'confirm password') {
              return text.length < 8 ? 'Please enter valid $label' : null;
            } else if (label == 'name') {
              return text.length < 4 ? 'Please enter valid $label' : null;
            }
            return null;
          },
          onChanged: (value) => _formKey.currentState!.validate(),
        ),
      ),
    );
  }
}
