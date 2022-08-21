import 'package:crocs/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({Key? key ,required this.categoryModel}) : super(key: key);
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: GridView.builder(
        primary: false,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 22,
            childAspectRatio: 0.8),
        itemCount: categoryModel.productIds?.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(id: categoryModel.productIds?[index]); 
        },
      ),
    );
  }
}
