import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';

class AuthenticatedGuard extends GetMiddleware {
  final prefs = Get.find<PrefUtils>();

  @override
  RouteSettings? redirect(String? route) {
    if (prefs.getToken() != null) {
      return null;
    } else {
      return RouteSettings(name: AppRoutes.loginScreen);
    }
  }
}
