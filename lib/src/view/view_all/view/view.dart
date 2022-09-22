import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:crocs/src/utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/category_model.dart';

class ViewAll extends AppColors {
  const ViewAll({Key? key, required this.categoryModel}) : super(key: key);
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: light,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: light,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: primary,
            size: 25.sp,
          ),
        ),
        actions: [
          Icon(
            Icons.shopping_bag,
            color: primary,
            size: 25.sp,
          ),
          SizedBox(width: 14.w)
        ],
        title: Center(
          child: Text(
            categoryModel.categaryName.toString(),
            style: TextStyle(
                fontWeight: FontWeight.w700, color: primary, fontSize: 20.sp),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              const SearchField(),
              SizedBox(height: 20.h),
              CustomGridView(categoryModel: categoryModel),
              SizedBox(height: size.height * 0.02)
            ],
          ),
        ),
      ),
    );
  }
}
