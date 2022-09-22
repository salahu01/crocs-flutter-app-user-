import 'package:crocs/src/services/user_services/user_services.dart';
import 'package:crocs/src/utils/themes/app_colors.dart';
import 'package:crocs/src/view/controller/view/view.dart';
import 'package:crocs/src/view/pilot_screens/view/pilot_screen.dart';
import 'package:flutter/material.dart';

class WrapperView extends AppColors {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserServices().getPilatesPageStatus(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return ColoredBox(
            color: light,
            child: const SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
            ),
          );
        }
        if (snapshot.hasData) {
          return snapshot.data ? Controller() : const PilotScreen();
        }
        return const SizedBox();
      },
    );
  }
}
