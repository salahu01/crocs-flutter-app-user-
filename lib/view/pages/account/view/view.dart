import 'package:crocs/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/widgets/common/custom_appbar.dart';

class Account extends AppColors {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: light,
      appBar: CustomAppBar(title: 'Account'),
      body: SingleChildScrollView(
        child: Column(
          children: [SizedBox(height: size.height * 0.1)],
        ),
      ),
    );
  }
}
