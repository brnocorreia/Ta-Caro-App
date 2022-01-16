import 'package:flutter/material.dart';
import 'package:tacaro_app/modules/feed/feed_page.dart';
import 'package:tacaro_app/modules/profile/profile_page.dart';
import 'package:tacaro_app/shared/models/user_model.dart';

import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'modules/login/pages/create account/create_account_page.dart';
import 'modules/splash/splash_page.dart';
// import 'shared/models/user_model.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tá Caro?",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
        "/login/create-account": (context) => const CreateAccountPage(),
        "/home": (context) => HomePage(
              pages: [
                FeedPage(),
                ProfilePage(),
              ],
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            )
      },
    );
  }
}
