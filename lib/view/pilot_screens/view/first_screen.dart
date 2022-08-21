import 'package:crocs/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstPilot extends AppColors {
  const FirstPilot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: light,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
    );
  }
}
