import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:crocs/src/view/cart/payment/payment.dart';
import 'package:crocs/src/view/cart/shop/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends AppColors {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      appBar: AppBar(
        leading: InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: primary,
            size: 23.sp,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: light,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Icon(
            Icons.shopping_cart,
            color: primary,
            size: 25.sp,
          ),
          SizedBox(width: 14.w)
        ],
        title: Center(
          child: Text(
            'CART',
            style: TextStyle(
                fontWeight: FontWeight.w700, color: primary, fontSize: 20.sp),
          ),
        ),
      ),
      body: PageView(
        children: const [Shop(), Payment()],
      ),
    );
  }
}
