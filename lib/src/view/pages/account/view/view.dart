import 'dart:developer';

import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:crocs/src/utils/widgets/widgets.dart';
import 'package:crocs/src/view/pages/account/cubit/event/event.dart';
import 'package:crocs/src/view/pages/account/cubit/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../auth/login/view/view.dart';

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
    log('message');
    return Scaffold(
      backgroundColor: light,
      appBar: CustomAppBar(title: 'My Account'),
      body: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
          context.read<AccountCubit>().fetchData();
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                  color: Colors.black, strokeWidth: 10),
            );
          }
          return SingleChildScrollView(
            primary: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                      visible: state is NotLoggedState,
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogInView(),
                          ),
                        ).whenComplete(
                            () => context.read<AccountCubit>().fetchData()),
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
                    visible: state is! NotLoggedState,
                    child: listViewBuilder(
                      contents: detailsWithAuth,
                      reations: detailsWithAuthReation,
                      icons: detailsWithAuthIcons,
                    ),
                  ),
                  SizedBox(height: 10.r),
                  listViewBuilder(
                    contents: appDeatils,
                    reations: appDeatilsReation,
                    icons: appDeatilsIcons,
                  ),
                  SizedBox(height: size.height * 0.11),
                ],
              ),
            ),
          );
        },
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
        padding: const EdgeInsets.all(0),
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
            height: 50,
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
