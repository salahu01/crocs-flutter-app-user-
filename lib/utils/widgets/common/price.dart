import 'package:crocs/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

class Price extends AppColors {
  const Price(
      {Key? key,
      required this.actualPrice,
      required this.currentPrice,
      this.color,
      this.fontWeight,
      required this.size})
      : super(key: key);
  final String actualPrice;
  final String currentPrice;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$ $actualPrice',
          style: TextStyle(
              color: primary,
              fontWeight: fontWeight ?? FontWeight.w800,
              fontSize: size,
              decoration: TextDecoration.lineThrough,
              decorationThickness: 2),
        ),
        Text(
          ' to \$ $currentPrice',
          style: TextStyle(
              color: color ?? primary,
              fontWeight: fontWeight ?? FontWeight.w800,
              fontSize: size,
              decorationThickness: 2),
        ),
      ],
    );
  }
}
