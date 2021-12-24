import 'package:flutter/material.dart';
import 'package:tacaro_app/shared/theme/app_theme.dart';
import 'package:tacaro_app/shared/widgets/button.dart';
import 'package:tacaro_app/shared/widgets/input_text.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({ Key? key }) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.background,
        leading: BackButton(color: AppTheme.colors.backButton),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Criando uma conta", style: AppTheme.textStyles.title),
            SizedBox(
              height: 10,
              ),
            Text("Mantenha seus gastos em dia", style: AppTheme.textStyles.subtitle),
            SizedBox(
              height: 38,
              ),
            InputText(label: "NOME", hint: "Digite o seu nome completo"),
            SizedBox(
              height: 18,
              ),
            InputText(label: "EMAIL", hint: "Digite o seu e-mail"),
            SizedBox(
              height: 18,
              ),
            InputText(label: "SENHA", hint: "Digite a sua senha"),
            SizedBox(
              height: 14,
            ),
            Button(
              label: "Criar conta", 
              onTap: () { 
              
              },
             ),
          ],
        ),
      ),
    );
  }
}