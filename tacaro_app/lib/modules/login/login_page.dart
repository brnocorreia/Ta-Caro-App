// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tacaro_app/shared/services/app_database.dart';
import 'package:tacaro_app/shared/theme/app_theme.dart';
import 'package:tacaro_app/shared/widgets/button.dart';
import 'package:tacaro_app/shared/widgets/input_text.dart';
import 'package:validators/validators.dart';

import 'login_controller.dart';
import 'repositories/login_repository_impl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller =
        LoginController(LoginRepositoryImpl(database: AppDatabase.instance));
    controller.addListener(() {
      controller.state.when(
          success: (value) =>
              Navigator.pushNamed(context, "/home", arguments: value),
          error: (message, _) => showModalBottomSheet<void>(
                backgroundColor: AppTheme.colors.background,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 250,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.error,
                              color: AppTheme.colors.badColor,
                              size: 80.0,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(message,
                                style: AppTheme.textStyles.buttonBoldTextColor),
                            SizedBox(
                              height: 20,
                            ),
                            Button(
                              label: 'Fechar',
                              type: ButtonType.outline,
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
          loading: () => print("Loading..."),
          orElse: () {});
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 200,
                ),
                InputText(
                  label: "EMAIL",
                  hint: "Digite o seu e-mail",
                  onChanged: (value) => controller.onChanged(email: value),
                  validator: (value) =>
                      isEmail(value) ? null : "Digite um e-mail válido!",
                ),
                SizedBox(
                  height: 18,
                ),
                InputText(
                  label: "SENHA",
                  hint: "Digite a sua senha",
                  onChanged: (value) => controller.onChanged(password: value),
                  validator: (value) => value.length >= 6
                      ? null
                      : "Digite uma senha com no mínimo 6 caracteres",
                  obscure: true,
                ),
                SizedBox(
                  height: 14,
                ),
                AnimatedBuilder(
                    animation: controller,
                    builder: (_, __) => controller.state.when(
                          loading: () => Column(
                            children: [
                              // SizedBox(height: 20),
                              CircularProgressIndicator(),
                            ],
                          ),
                          orElse: () => Column(
                            children: [
                              Button(
                                label: "Entrar",
                                onTap: () {
                                  controller.login();
                                },
                              ),
                              SizedBox(height: 30),
                              Button(
                                label: "Criar conta",
                                type: ButtonType.outline,
                                onTap: () {
                                  print("Criar conta");
                                  Navigator.pushNamed(
                                      context, "/login/create-account");
                                },
                              )
                            ],
                          ),
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
