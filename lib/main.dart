import 'package:crocs/src/view/controller/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) =>  
      const MaterialApp(
        home: Controller(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
