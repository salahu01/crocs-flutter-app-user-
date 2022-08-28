import 'package:crocs/utils/widgets/common/product_card/cubit/event/event.dart';
import 'package:crocs/utils/widgets/common/product_card/cubit/state/state.dart';
import 'package:crocs/view/product_view/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCardCubit(id),
      child: const ProductCardView(),
    );
  }
}

class ProductCardView extends StatelessWidget {
  const ProductCardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCardCubit, ProductCardState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Shimmer(
                child: ColoredBox(
                  color: Colors.grey.shade300,
                  child: SizedBox(
                    width: 90.w,
                    height: 120.h,
                  ),
                ),
              ),
            ),
          );
        } else if (state is ErrorState) {
          return const Center(
            child: Icon(Icons.error),
          );
        } else if (state is LoadedState) {
          final product = state.product;
          return InkWell(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductView(product: product)));
            },
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 90.w,
                    child: Image.network(
                      product.image.toString(),
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: Shimmer(
                              child: ColoredBox(
                                color: Colors.grey.shade300,
                                child: SizedBox(
                                  width: 90.w,
                                  height: 120.h,
                                  child: Center(
                                    child: Icon(
                                      Icons.error_outline,
                                      color: Colors.black,
                                      size: 30.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Price(
                  actualPrice: product.actualPrice ?? '',
                  currentPrice: product.currentPrice ?? '',
                  size: 11.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.red,
                ),
                SizedBox(height: 3.h),
                SizedBox(
                  height: 20.h,
                  width: 90.w,
                  child: Marquee(
                    text: product.productName.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 20.0,
                    velocity: 100.0,
                    pauseAfterRound: const Duration(seconds: 1),
                    startPadding: 10,
                    accelerationDuration: const Duration(seconds: 4),
                    accelerationCurve: Curves.linear,
                    decelerationCurve: Curves.linear,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
