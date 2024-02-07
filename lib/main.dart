import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test_users/helper/route_helper.dart';
import 'package:test_users/theme/theme.dart';

import 'controller/users_controller.dart';

void main() {
  Get.lazyPut(() => UsersController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RouteHelper.routes,
      initialRoute: RouteHelper.users,
      theme: appTheme(),
      transitionDuration: const Duration(
          milliseconds: 500
      ),
      defaultTransition: Transition.topLevel,
    );
  }
}