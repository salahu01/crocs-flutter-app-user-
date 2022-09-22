import 'package:crocs/src/services/user_services/user_services.dart';
import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:crocs/src/view/controller/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/widgets/widgets.dart';

class PilotScreen extends AppColors {
  const PilotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: light,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://ik.imagekit.io/vun0le607a/Screenshot_2022-09-09_at_12.10.01_PM_1wnoFtAst.png?ik-sdk-version=javascript-1.4.3&updatedAt=1662713313340',
              height: size.height * 0.5,
              fit: BoxFit.cover,
            ),
            text(
              text: 'Start Journey',
              fontWeight: FontWeight.w900,
              size: 35.sp,
            ),
            SizedBox(
              height: 5.h,
            ),
            text(
              text: 'With Us',
              fontWeight: FontWeight.w900,
              size: 35,
            ),
            SizedBox(
              height: 10.h,
            ),
            text(
              text: 'Smart, gorgeous & fashionable collection',
              fontWeight: FontWeight.w700,
              size: 15.sp,
            ),
            SizedBox(
              height: 10.h,
            ),
            const Expanded(child: SizedBox()),
            CustomButton(
              height: size.height * 0.1,
              width: size.width * 0.4,
              onTap: () {},
              dialog: 'Join Us',
              icon: Icons.link,
            ),
            const Expanded(child: SizedBox()),
            CustomButton(
              height: size.height * 0.1,
              width: size.width * 0.4,
              onTap: () async {
                await UserServices().setpilatesPageStatus()
                    ? Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Controller(),
                        ),
                        (route) => false)
                    : null;
              },
              dialog: 'Explore',
              icon: Icons.explore,
            ),
          ],
        ),
      ),
    );
  }

  Widget text(
          {required String text,
          double? size,
          FontWeight? fontWeight,
          Color? color}) =>
      Text(
        text,
        style: TextStyle(
          color: color ?? primary,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontSize: size ?? 30.sp,
        ),
      );
}
