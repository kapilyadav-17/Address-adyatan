import 'package:aadhar_address_update/pages/home.dart';
import 'package:aadhar_address_update/pages/inbox.dart';
import 'package:aadhar_address_update/pages/index.dart';
import 'package:aadhar_address_update/pages/operatorUpdateAddressInput.dart';
import 'package:aadhar_address_update/pages/otp.dart';
import 'package:aadhar_address_update/pages/selectOperator.dart';
import 'package:aadhar_address_update/pages/selfAddressUpdateInput.dart';
import 'package:aadhar_address_update/pages/selfUpdateAddress.dart';
import 'package:aadhar_address_update/pages/splashFirst.dart';
import 'package:aadhar_address_update/widgets/done.dart';
import 'package:flutter/material.dart';

class Router {
  static const String splashFirst = '/splashFirst';

  static const String index = '/index';
  static const String otp = '/otp';
  static const String home = '/home';

  static const String selfUpdateAddress = '/selfUpdateAddress';
  static const String selfAddressUpdateInput = '/selfAddressUpdateInput';
  static const String inbox = '/inbox';

  static const String operatorUpdateAddressInput =
      '/operatorUpdateAddressInput';
  static const String selectOperator = '/selectOperator';

  static const String done = '/done';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashFirst:
        return MaterialPageRoute(builder: (context) => const SplashFirst());
      case index:
        return MaterialPageRoute(builder: (context) => const Index());
      case otp:
        var navigateTo = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => OTP(navigateTo: navigateTo.toString()));
      case home:
        return MaterialPageRoute(builder: (context) => const Home());

      case selfUpdateAddress:
        return MaterialPageRoute(
            builder: (context) => const SelfAddressUpdate());
      case selfAddressUpdateInput:
        return MaterialPageRoute(
            builder: (context) => const SelfAddressUpdateInput());
      case inbox:
        return MaterialPageRoute(builder: (context) => const Inbox());

      case operatorUpdateAddressInput:
        return MaterialPageRoute(
            builder: (context) => const OperatorAddressUpdateInput());
      case selectOperator:
        return MaterialPageRoute(builder: (context) => const SelectOperator());

      case done:
        return MaterialPageRoute(builder: (context) => const Done());
      default:
        return MaterialPageRoute(builder: (context) => const Index());
    }
  }
}
