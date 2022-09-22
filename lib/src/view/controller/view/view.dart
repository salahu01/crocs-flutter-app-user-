import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:crocs/src/view/controller/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../pages/pages.dart';


class Controller extends AppColors {
  Controller({Key? key}) : super(key: key);
  final _bucket = PageStorageBucket();
  final List bottomIcons = [
    [Icons.home, 0],
    [Icons.category, 1],
    [Icons.person, 2]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: IndexedStack(
        index: context.select((ControllerCubit cubit) => cubit.state),
        children: [
          PageStorage(
              bucket: _bucket, child: const Home(key: PageStorageKey('key1'))),
          PageStorage(
              bucket: _bucket,
              child: const Category(key: PageStorageKey('key2'))),
          PageStorage(
              bucket: _bucket,
              child: Account(key: const PageStorageKey('key3'))),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 25.r, left: 20.r, right: 20.r),
        height: 45.h,
        decoration: BoxDecoration(
            color: primary, borderRadius: BorderRadius.circular(20)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bottomIcons
                .map(
                  (e) => Expanded(
                    child: IconButton(
                      onPressed: () =>
                          context.read<ControllerCubit>().changePage(e[1]),
                      icon: Icon(
                        e[0],
                        color: context.select(
                          (ControllerCubit cubit) => cubit.state != e[1]
                              ? const Color.fromARGB(255, 59, 52, 52)
                              : light,
                        ),
                      ),
                    ),
                  ),
                )
                .toList()),
      ),
      backgroundColor: light,
    );
  }
}
