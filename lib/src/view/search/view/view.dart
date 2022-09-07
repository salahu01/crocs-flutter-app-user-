import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends AppColors {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: light,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 100.h,
        elevation: 0,
        leadingWidth: 0,
        title: Align(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: primary,
                      size: 25.sp,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  text(text: 'Search here', fontWeight: FontWeight.w800)
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 45.h,
                      child: TextField(
                        cursorColor: primary,
                        cursorHeight: 20.sp,
                        style: TextStyle(
                          letterSpacing: 0.4.sp,
                          color: primary,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.clear,
                              color: primary,
                              size: 22.sp,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          contentPadding: EdgeInsets.only(left: 15.w),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: 45.h,
                        height: 45.h,
                        child: ColoredBox(
                          color: lowLight,
                          child: Icon(
                            Icons.search,
                            color: primary,
                            size: 23.sp,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h)
            ],
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 5.h);
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: text(text: 'product ${index + 1}', size: 15.sp),
          );
        },
      ),
    );
  }

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
