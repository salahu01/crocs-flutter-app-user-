import 'package:crocs/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/pages.dart';
import '../controller.dart';

class Controller extends StatelessWidget {
  const Controller({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ControllerCubit(),
      child: ControllerView(),
    );
  }
}

class ControllerView extends AppColors {
  ControllerView({Key? key}) : super(key: key);
  final _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          IndexedStack(
            index: context.select((ControllerCubit cubit) => cubit.state),
            children: [
              PageStorage(
                  bucket: _bucket,
                  child: const Home(key: PageStorageKey('key1'))),
              PageStorage(
                  bucket: _bucket,
                  child: const Category(key: PageStorageKey('key2'))),
              PageStorage(
                  bucket: _bucket,
                  child: Account(key: const PageStorageKey('key3'))),
            ],
          ),
          Column(
            children: [
              SizedBox(height: size.height * 0.9),
              Container(
                margin: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: size.height * 0.02,
                ),
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(20.sp)),
                height: size.height * 0.08,
                child: BottomNavigationBar(
                  currentIndex:
                      context.select((ControllerCubit cubit) => cubit.state),
                  selectedItemColor: light,
                  unselectedItemColor: Colors.grey.shade500,
                  iconSize: size.height / 30,
                  elevation: 0,
                  onTap: (index) {
                    context.read<ControllerCubit>().changePage(index);
                  },
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.category), label: ''),
                    BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: light,
    );
  }
}
