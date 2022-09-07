import 'package:crocs/src/model/product_model.dart';
import 'package:crocs/src/utils/widgets/common/addtocart/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({Key? key, required this.product, required this.widget})
      : super(key: key);
  final Widget widget;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddToCartCubit(),
      child: InkWell(
        onTap: () => context.read<AddToCartCubit>().addToCart(product: product),
        child: widget,
      ),
    );
  }
}
