import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/widgets/widgets.dart';
import '../../home/cubit/event/event.dart';
import '../../home/cubit/state/state.dart';

class Category extends AppColors {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: light,
      appBar: CustomAppBar(title: 'Category'),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                  color: Colors.black, strokeWidth: 10),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Icon(Icons.error),
            );
          }else if (state is NetworkErrorState) {
            return NetorkErrorWidget(
              onTap: () => context.read<HomeCubit>().fetchData(),
            );
          }  else if (state is LoadedState) {
            final category = state.category;
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      const SearchField(),
                      SizedBox(height: 30.h),
                      HoriList(categoryModel: category[0]),
                      SizedBox(height: 12.h),
                      HoriList(categoryModel: category[4]),
                      SizedBox(height: 12.h),
                      HoriList(categoryModel: category[3]),
                      SizedBox(height: size.height * 0.12)
                    ],
                  ),
                ));
          } else {
            return const SizedBox();
          }
        },
        // body:
      ),
    );
  }
}
