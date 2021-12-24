
import 'package:flutter/material.dart';
import 'package:tacaro_app/shared/models/user_model.dart';
import 'package:tacaro_app/shared/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  final UserModel user;
  const HomePage({ Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Olá, ${user.name}", style: AppTheme.textStyles.title),
      )
    );
  }
}
