import 'package:flutter/material.dart';
import 'package:tacaro_app/shared/widgets/button.dart';
import 'package:tacaro_app/shared/widgets/input_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png",
            width: 200,
            ),
            InputText(label: "E-mail", hint: "Digite o seu e-mail"),
            SizedBox(
              height: 18,
              ),
            InputText(label: "Senha", hint: "Digite a sua senha"),
            SizedBox(
              height: 14,
            ),
            Button(label: "Entrar",),
            SizedBox(
              height: 30),
            Button(
              label: "Criar conta",
              type: ButtonType.outline,
            )
              
          ],
        ),
      ),
    );
  }
}

