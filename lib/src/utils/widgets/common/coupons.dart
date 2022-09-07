import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Coupons extends StatelessWidget {
  const Coupons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 9, 19, 33), Colors.black],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            'SignUp Offer',
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          Text(
            '20 % Off',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.w700),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
