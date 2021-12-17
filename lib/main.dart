import 'package:aadhar_address_update/config/routes/routing.dart' as router;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      /*initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MyHomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/otp': (context) => const OTP(
              navigateTo: '/home',
            ),
        '/home': (context) => const Home(),
        '/selfUpdateAddress': (context) => const SelfUpdate(),
        '/updateAddress': (context) => const UpdateData(),
      },*/
      initialRoute: router.Router.splashFirst,
      onGenerateRoute: router.Router.generateRoute,
    );
  }
}
