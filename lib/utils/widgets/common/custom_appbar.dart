import 'package:crocs/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view/cart/cart.dart';

class CustomAppBar extends AppColors implements PreferredSizeWidget {
  CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  final Size preferredSize = Size(double.maxFinite, 50.h);

  @override
  Widget build(BuildContext context) => AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: light,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          InkWell(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Cart())),
            child: Icon(
              Icons.shopping_bag,
              color: primary,
              size: 25.sp,
            ),
          ),
          SizedBox(width: 10.w),
          Icon(
            Icons.notifications,
            color: primary,
            size: 25.sp,
          ),
          SizedBox(width: 14.w)
        ],
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w800, color: primary, fontSize: 20.sp),
        ),
      );
}
