import 'package:flutter/material.dart';
import 'package:tacaro_app/modules/feed/feed_page.dart';
import 'package:tacaro_app/shared/theme/app_theme.dart';
import 'package:tacaro_app/shared/widgets/app_bottom_navigator.dart';
// import 'package:tacaro_app/shared/models/user_model.dart';
// import 'package:tacaro_app/shared/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  // final UserModel user;
  const HomePage({
    Key? key,
    /*required this.user*/
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.colors.background,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              FeedPage(),
              Positioned(
                bottom: 14,
                left: 26,
                right: 26,
                child: AppBottomNavigator(
                  currentIndex: currentIndex,
                  onChanged: changeIndex,
                ),
              )
            ],
          ),
        ));
  }
}
