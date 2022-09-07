import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:crocs/src/utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Shop extends AppColors {
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: light,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(15.r),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://www.shopcrocs.in/media/catalog/product/2/0/207984_90h_alt100.jpeg?auto=webp&format=pjpg&width=1280&height=1600&fit=cover',
                            height: 90.sp,
                          ),
                          Flexible(
                            child: Column(
                              children: [
                                Text(
                                  'CHUMBAK X CROCS CLASSIC RED/MULTI UNISEX CLOG',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                Row(
                                  children: [
                                    const Spacer(),
                                    button(text: 'M'),
                                    SizedBox(width: 30.w),
                                    button(text: '2'),
                                    SizedBox(width: 15.w),
                                    Text(
                                      '\$ 24.00',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: size.height * 0.06)
            ],
          ),
          CustomButton(
              onTap: () {},
              dialog: 'Check Out',
              icon: Icons.shopping_cart_checkout_rounded,
              width: 0.2)
        ],
      ),
    );
  }

  Widget button({required String text}) => ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: SizedBox(
          height: 40.sp,
          width: 40.sp,
          child: ColoredBox(
            color: primary,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: light, fontSize: 15.sp, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      );
}
