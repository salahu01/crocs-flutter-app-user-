import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:crocs/src/utils/widgets/widgets.dart';
import 'package:crocs/src/view/pages/home/cubit/event/event.dart';
import 'package:crocs/src/view/pages/home/cubit/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends AppColors {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: light,
      appBar: CustomAppBar(title: 'Home'),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                  color: Colors.black, strokeWidth: 10),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Icon(Icons.error, size: 40.sp),
            );
          } else if (state is NetworkErrorState) {
            return NetorkErrorWidget(
              onTap: () => context.read<HomeCubit>().fetchData(),
            );
          } else if (state is LoadedState) {
            final category = state.category;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Stack(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: const SearchField()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        const SearchField(),
                        SizedBox(height: 30.h),
                        const Coupons(),
                        SizedBox(height: 30.h),
                        HoriList(
                          categoryModel: category[1],
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          category[2].categaryName.toString(),
                          style: TextStyle(
                              color: primary,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 12.h),
                        CustomGridView(categoryModel: category[2]),
                        SizedBox(height: size.height * 0.11)
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
