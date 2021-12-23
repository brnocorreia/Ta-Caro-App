import 'package:flutter/material.dart';
import 'modules/login/login_page.dart';
import 'modules/login/pages/create account/create_account_page.dart';
import 'modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Race 1",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/login/create-account",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
        "/login/create-account": (context) => const CreateAccountPage(),
      },
    );
  }
}