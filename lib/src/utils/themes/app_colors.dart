import 'package:flutter/material.dart';

abstract class AppColors extends StatelessWidget {
  const AppColors({super.key});

  Color get primary => const Color.fromARGB(255, 31, 33, 40);
  Color get lightPrimary => const Color.fromARGB(255, 46, 49, 59);
  Color get lowLight => Colors.grey.shade300;
  Color get light => Colors.white;
  
}
