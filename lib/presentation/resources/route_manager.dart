import 'package:advanced_app/presentation/forget_password/forget_password_view.dart';
import 'package:advanced_app/presentation/login/login_view.dart';
import 'package:advanced_app/presentation/main/main_view.dart';
import 'package:advanced_app/presentation/register/register_view.dart';
import 'package:advanced_app/presentation/resources/string_manager.dart';
import 'package:advanced_app/presentation/splash/splash_view.dart';
import 'package:advanced_app/presentation/store_details/store_details.dart';
import 'package:flutter/material.dart';

class RouteName {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String passwordRoute = "/password";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRout(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouteName.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouteName.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case RouteName.passwordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case RouteName.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case RouteName.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case RouteName.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetails());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppString.noRoute),
                centerTitle: true,
              ),
              body: Text(AppString.noRoute),
            ));
  }
}
