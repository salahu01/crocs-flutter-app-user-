import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:crocs/src/utils/widgets/widgets.dart';
import 'package:crocs/src/view/auth/signup/cubit/event/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../login/view/view.dart';
import '../cubit/state/state.dart';

class SignUpView extends AppColors {
  SignUpView({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: light,
      body: BlocProvider(
        create: (context) => SignUpCubit(),
        child: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            return SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/signup.jpeg',
                          width: size.width * 1,
                          height: size.height * 0.28,
                          fit: BoxFit.contain,
                        ),
                        Hero(
                          tag: 'auth_hero_tag',
                          child: Material(
                            child: text(
                                text: 'SignUp',
                                size: 30.sp,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CustomTextField(
                          label: 'name',
                          icon: Icons.person,
                        ),
                        CustomTextField(
                          label: 'email',
                          icon: Icons.email,
                        ),
                        CustomTextField(
                          label: 'password',
                          icon: Icons.lock,
                        ),
                        CustomTextField(
                          label: 'confirm password',
                          icon: Icons.lock,
                        ),
                        CustomButton(
                          width: size.width * 0.4,
                          height: size.height * 0.09,
                          icon: Icons.navigate_next_sharp,
                          dialog: 'SignUp',
                          onTap: () => context.read<SignUpCubit>().validate(
                              email: email.text,
                              password: password.text,
                              userName: userName.text,
                              context: context),
                        ),
                        SizedBox(height: 10.h),
                        AuthDialog(
                          dialog: 'Already have account ? ',
                          title: ' LogIn',
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogInView()));
                          },
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: state is LoadingState,
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
              ),
            );
          },
        ),
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
