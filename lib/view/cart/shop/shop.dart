import 'package:crocs/utils/themes/app_colors.dart';
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
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 1,
                                  child: const Padding(
                                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Text(
                                      'CHUMBAK X CROCS CLASSIC RED/MULTI UNISEX CLOG',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 60.h),
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
                                          ),
                                        ),
                                      ],
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
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(
                  left: size.width * 0.22,
                  right: size.width * 0.22,
                  bottom: size.height * 0.02,
                ),
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(20.sp)),
                height: size.height * 0.08,
                child: SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      const Spacer(flex: 2),
                      Text(
                        'Buy Now',
                        style: TextStyle(
                          color: light,
                          fontWeight: FontWeight.w700,
                          fontSize: 23.sp,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.payment,
                        color: light,
                        size: 25.sp,
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
