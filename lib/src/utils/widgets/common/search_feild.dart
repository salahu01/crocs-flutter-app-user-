import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:crocs/src/view/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends AppColors {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SearchScreen())),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: SizedBox(
            height: 45.h,
            child: ColoredBox(
              color: lowLight,
              child: Row(
                children: [
                  const Spacer(),
                  Icon(
                    Icons.search,
                    color: primary,
                    size: 22.sp,
                  ),
                  SizedBox(width: 10.w)
                ],
              ),
            )),
      ),
    );
  }
}
