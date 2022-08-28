import 'package:crocs/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

class LogInView extends AppColors {
  const LogInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      body: Column(
        children: [
          Image.asset('assets/images/login.jpeg',
          width: double.maxFinite,
          )
        ],
      ),
    );
  }
}
