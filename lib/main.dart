import 'package:crocs/src/view/auth/login/cubit/event/event.dart';
import 'package:crocs/src/view/auth/signup/cubit/event/event.dart';
import 'package:crocs/src/view/controller/cubit/cubit.dart';
import 'package:crocs/src/view/pages/account/cubit/event/event.dart';
import 'package:crocs/src/view/pages/home/cubit/event/event.dart';
import 'package:crocs/src/view/product_view/cubit/cubit.dart';
import 'package:crocs/src/view/wrapper/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => AccountCubit()),
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => ControllerCubit()),
        BlocProvider(create: (context) => LogInCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => const MaterialApp(
          home: WrapperView(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
