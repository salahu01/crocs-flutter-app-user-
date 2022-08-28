import 'package:crocs/utils/themes/app_colors.dart';
import 'package:crocs/utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends AppColors {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: light,
      body: Column(
        children: [
          Image.asset(
            'assets/images/signup.jpeg',
            width: double.maxFinite,
          ),
          expanded(1),
          text(text: 'SignUp', size: 30.sp),
          expanded(1),
          const CustomTextField(label: 'name'),
          expanded(1),
          const CustomTextField(label: 'email'),
          expanded(1),
          const CustomTextField(label: 'password'),
          expanded(5),
          CustomButton(
              width: 0.28,
              icon: Icons.navigate_next_sharp,
              dialog: 'SignUp',
              onTap: () {}),
          expanded(1),
        ],
      ),
    );
  }

  Widget expanded(int flex) => Expanded(flex: flex, child: const SizedBox());

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
