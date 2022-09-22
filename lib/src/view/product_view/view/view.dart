import 'package:crocs/src/model/product_model.dart';
import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:crocs/src/utils/widgets/widgets.dart';
import 'package:crocs/src/view/product_view/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../services/api/cart_services/cart_services.dart';

class ProductView extends AppColors {
  const ProductView({Key? key, required this.product}) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: light,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.r),
                child: Column(
                  children: [
                    AppBar(
                      leading: InkWell(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: primary,
                          size: 23.sp,
                        ),
                      ),
                      leadingWidth: 23,
                      actions: [
                        InkWell(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          onTap: () {
                            CartServices().addToCart();
                          },
                          child: Icon(
                            Icons.favorite,
                            color: primary,
                            size: 23.sp,
                          ),
                        ),
                      ],
                      elevation: 0,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarIconBrightness: Brightness.dark,
                          statusBarColor: light),
                      backgroundColor: Colors.transparent,
                    ),
                    Builder(builder: (context) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 260.h,
                            child: Center(
                              child: Hero(
                                tag: product.id.toString(),
                                child: Image.network(
                                  product.image.toString(),
                                  height: context.select(
                                              (ProductCubit state) =>
                                                  state.state) ==
                                          'S'
                                      ? 200.h
                                      : context.select((ProductCubit state) =>
                                                  state.state) ==
                                              'M'
                                          ? 220.h
                                          : 240.h,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Price(
                              size: 26.sp,
                              actualPrice: product.actualPrice ?? '',
                              currentPrice: product.currentPrice ?? ''),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              Text(
                                'Size : ',
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const Spacer(),
                              sizeButton(context, 'S'),
                              const Spacer(),
                              sizeButton(context, 'M'),
                              const Spacer(),
                              sizeButton(context, 'L'),
                              const Spacer(),
                            ],
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 17.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        product.productName.toString(),
                        style: TextStyle(
                          color: primary,
                          fontSize: 18.sp,
                          height: 1.15.r,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: 17.h),
                    detail(
                      Icons.cleaning_services_outlined,
                      'Easy to Clean',
                      'Washes off with soap and water, perfect for kids and active families.',
                    ),
                    detail(
                      Icons.fingerprint,
                      'Low Carbon Footprint',
                      '*This metric was calculated using the Higg Product Module 1.0 at Higg.org. This calculation was conducted internally, was 3rd party verified, and represents a cradle-to-grave impact.',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        button(50.h, size.width * 0.42, 'Buy Now'),
                        AddToCart(
                          product: product,
                          widget: button(50.h, size.width * 0.42,'Add To Cart'),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Review  :  ',
                        style: TextStyle(
                          color: primary,
                          fontSize: 18.sp,
                          height: 1.15.r,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Divider(
                      color: primary,
                      thickness: 2,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Share Experience',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide:
                                    BorderSide(color: primary, width: 5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.send,
                              color: primary,
                              size: 25.sp,
                            ))
                      ],
                    ),
                    SizedBox(height: 10.h),
                    commentBox('Very Nice Product ! Wow'),
                    SizedBox(height: 10.h),
                    commentBox(' Wow , Its good'),
                    SizedBox(height: 10.h),
                    commentBox('Nice product'),
                    SizedBox(height: size.height * 0.01)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget button(double height, double width, String text) => DecoratedBox(
        decoration: BoxDecoration(
            color: primary, borderRadius: BorderRadius.circular(20.r)),
        child: SizedBox(
          height: height,
          width: width,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: light,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      );

  Widget sizeButton(BuildContext context, String text) => SizeButton(
        onTap: () => context.read<ProductCubit>().changeSize(text),
        backgroundColor:
            context.select((ProductCubit state) => state.state) == text
                ? primary
                : light,
        text: text,
        textColor: context.select((ProductCubit state) => state.state) == text
            ? light
            : primary,
      );
  Widget detail(IconData icon, String textHead, String textSub) => Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.green[800],
                size: 35.sp,
              ),
              SizedBox(width: 20.w),
              Text(
                textHead,
                style: TextStyle(
                  color: primary,
                  fontSize: 18.sp,
                  height: 1.15.r,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              textSub,
              style: TextStyle(
                color: primary,
                fontSize: 15.sp,
                height: 1.2.r,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      );

  Widget commentBox(String text) => ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: SizedBox(
          width: double.maxFinite,
          height: 50.h,
          child: ColoredBox(
            color: Colors.grey.shade300,
            child: Row(
              children: [
                SizedBox(width: 10.w),
                Text(
                  text,
                  maxLines: 10,
                  style: TextStyle(
                      color: primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      );
}
