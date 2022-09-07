import 'package:crocs/src/model/category_model.dart';
import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:crocs/src/utils/widgets/widgets.dart';
import 'package:crocs/src/view/view_all/view.all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoriList extends AppColors {
  const HoriList({Key? key, required this.categoryModel}) : super(key: key);
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              categoryModel.categaryName.toString(),
              style: TextStyle(
                  color: primary, fontSize: 18.sp, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            InkWell(
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewAll(categoryModel: categoryModel)));
                },
                child: Icon(
                  Icons.view_agenda,
                  size: 22.sp,
                  color: primary,
                )),
          ],
        ),
        SizedBox(height: 12.h),
        SizedBox(
          width: double.maxFinite,
          height: 160.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 20.w);
            },
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(id: categoryModel.productIds?[index]);
            },
          ),
        ),
      ],
    );
  }
}
