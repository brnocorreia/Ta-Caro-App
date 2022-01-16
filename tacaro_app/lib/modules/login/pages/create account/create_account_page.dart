// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:tacaro_app/modules/login/repositories/login_repository_impl.dart';
import 'package:tacaro_app/shared/services/app_database.dart';
import 'package:tacaro_app/shared/theme/app_theme.dart';
import 'package:tacaro_app/shared/widgets/button.dart';
import 'package:tacaro_app/shared/widgets/input_text.dart';
import 'package:validators/validators.dart';
import 'create_account_controller.dart';
import 'package:change_case/change_case.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  late final CreateAccountController controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = CreateAccountController(
        repository: LoginRepositoryImpl(database: AppDatabase.instance));
    controller.addListener(() {
      controller.state.when(
          success: (value) => Navigator.pop(context),
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
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppTheme.colors.background,
          leading: BackButton(color: AppTheme.colors.backButton),
          elevation: 0,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Criando uma conta",
                    style: AppTheme.textStyles.title,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Mantenha seus gastos em dia",
                      style: AppTheme.textStyles.subtitle),
                  SizedBox(
                    height: 32,
                  ),
                  InputText(
                    label: "NOME",
                    hint: "Digite o seu nome completo",
                    onChanged: (value) =>
                        controller.onChanged(name: value.toCapitalCase()),
                    validator: (value) =>
                        value.isNotEmpty ? null : "Digite seu nome completo",
                  ),
                  SizedBox(
                    height: 18,
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
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                        "•  Sua senha deve conter no mínimo 6 caracteres",
                        style: AppTheme.textStyles.instructions),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (_, __) => controller.state.when(
                      loading: () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              // SizedBox(height: 20),
                              CircularProgressIndicator(),
                            ],
                          ),
                        ],
                      ),
                      orElse: () => Button(
                        label: "Criar conta",
                        onTap: () {
                          controller.create();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
