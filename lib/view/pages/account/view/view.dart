import 'package:crocs/utils/themes/app_colors.dart';
import 'package:crocs/utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../utils/widgets/widgets.dart';

class Account extends AppColors {
  Account({Key? key}) : super(key: key);
  final List<String> appDeatils = [
    'FAQs',
    'ABOUT US',
    'TERMS OF USE',
    'PRIVACY POLICY'
  ];
  final List<String> detailsWithAuth = [
    'My Orders',
    'Address',
    'Favourite Products',
    'My Cards'
  ];
  final List<IconData> detailsWithAuthIcons = [
    Icons.local_shipping,
    Icons.sticky_note_2,
    Icons.favorite_outlined,
    Icons.credit_card
  ];
  final List<IconData> appDeatilsIcons = [
    Icons.question_answer,
    Icons.info_outline,
    Icons.article,
    Icons.key
  ];

  final List<VoidCallback> appDeatilsReation = [() {}, () {}, () {}, () {}];
  final List<VoidCallback> detailsWithAuthReation = [
    () {},
    () {},
    () {},
    () {}
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: light,
      appBar: CustomAppBar(title: 'My Account'),
      body: SingleChildScrollView(
        primary: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              ListTile(
                dense: true,
                contentPadding: const EdgeInsets.all(0),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(1000.r),
                  child: Image.asset(
                    'assets/images/unknown.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                title: text(text: "Unknown", fontWeight: FontWeight.w700),
                trailing: Visibility( 
                  visible: true,
                  child: InkWell(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: ColoredBox(
                        color: primary,
                        child: SizedBox(
                          height: 40.h,
                          width: 70.w,
                          child: Center(
                            child: text(
                              text: 'LogIn',
                              color: light,
                              size: 15.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Visibility(
                visible: true,
                child: listViewBuilder(
                  contents: detailsWithAuth,
                  reations: detailsWithAuthReation,
                  icons: detailsWithAuthIcons,
                ),
              ),
              SizedBox(height: 13.h),
              listViewBuilder(
                contents: appDeatils,
                reations: appDeatilsReation,
                icons: appDeatilsIcons,
              ),
              SizedBox(height: size.height * 0.11),
            ],
          ),
        ),
      ),
    );
  }

  Widget listViewBuilder(
          {required List<String> contents,
          required List<VoidCallback> reations,
          required List<IconData> icons}) =>
      ListView.separated(
        itemCount: contents.length,
        shrinkWrap: true,
        primary: false,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 13.h);
        },
        itemBuilder: (context, index) => DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: primary, width: 1),
          ),
          child: SizedBox(
            height: 50.h,
            child: ListTile(
              onTap: reations[index],
              dense: true,
              title: text(
                text: contents[index],
                size: 14.sp,
                fontWeight: FontWeight.w800,
              ),
              trailing: Icon(
                icons[index],
                color: Colors.grey,
                size: 23.sp,
              ),
            ),
          ),
        ),
      );

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
