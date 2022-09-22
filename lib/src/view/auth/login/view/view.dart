import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:crocs/src/view/auth/login/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/widgets/widgets.dart';
import '../../signup/view/view.dart';

class LogInView extends AppColors {
  LogInView({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController(text: 'salahu@gmail.com');
  final TextEditingController password = TextEditingController(text: '12345678');
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: light,
      body: BlocBuilder<LogInCubit, LogInState>(
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                primary: true,
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.05),
                    Image.asset(
                      'assets/images/login.jpeg',
                      width: size.width * 1,
                      height: size.height * 0.35,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 10.h),
                    text(
                      text: 'LogIn',
                      size: 30.sp,
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(height: 30.h),
                    Form(
                      key: _emailFormKey,
                      child: CustomTextField(
                        onChanged: (p0) =>
                            _emailFormKey.currentState!.validate(),
                        controller: email,
                        label: 'email',
                        icon: Icons.email,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Form(
                      key: _passwordFormKey,
                      child: CustomTextField(
                        controller: password,
                        label: 'password',
                        icon: Icons.lock,
                        onChanged: (p0) =>
                            _passwordFormKey.currentState!.validate(),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    CustomButton(
                      width: size.width * 0.35,
                      height: size.height * 0.09,
                      icon: Icons.link,
                      dialog: 'LogIn',
                      onTap: () => context.read<LogInCubit>().validate(
                            email: email.text,
                            password: password.text,
                            context: context,
                          ),
                    ),
                    SizedBox(height: 25.h),
                    Hero(
                      tag: 'auth_hero_tag',
                      child: Material(
                        child: InkWell(
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpView(),
                            ),
                          ),
                          child: const AuthDialog(
                            dialog: 'Don\'t have account ? ',
                            title: ' SignUp',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                // visible: state is LoadingState,
                visible: false,
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: ColoredBox(
                    color: Colors.black45,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 8,
                        color: light,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget text(
          {required String text,
          Color? color,
          double? size,
          FontWeight? fontWeight}) =>
      Text(
        text,
        style: TextStyle(
          color: color ?? primary,
          fontSize: size ?? 20.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
      );
}
