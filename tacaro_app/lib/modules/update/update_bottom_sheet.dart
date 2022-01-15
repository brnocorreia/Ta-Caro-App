import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:tacaro_app/modules/update/update_controller.dart';
import 'package:tacaro_app/shared/services/app_database.dart';
import 'package:tacaro_app/shared/theme/app_theme.dart';
import 'package:tacaro_app/shared/widgets/button.dart';
import 'package:tacaro_app/shared/widgets/input_text.dart';

import 'repositories/update_repository_impl.dart';

class UpdateBottomSheet extends StatefulWidget {
  const UpdateBottomSheet({Key? key}) : super(key: key);

  @override
  State<UpdateBottomSheet> createState() => _UpdateBottomSheetState();
}

class _UpdateBottomSheetState extends State<UpdateBottomSheet> {
  late final UpdateController controller;

  @override
  void initState() {
    controller = UpdateController(
        repository: UpdateRepositoryImpl(database: AppDatabase.instance));
    controller.addListener(() {
      controller.state.when(
        success: (_) {
          Navigator.pop(context);
        },
        orElse: () {},
      );
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
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 42,
        vertical: 16,
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Editar"),
            SizedBox(
              height: 32,
            ),
            InputText(
              label: "Produto",
              hint: "Digite um nome",
              onChanged: (value) => controller.onChanged(name: value),
              validator: (value) => value.isNotEmpty ? null : "Digite um nome!",
            ),
            SizedBox(
              height: 8,
            ),
            InputText(
              label: "Preço",
              hint: "Digite o valor",
              onChanged: (value) => controller.onChanged(price: value),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value.isNotEmpty ? null : "Digite um valor!",
              inputFormatters: [
                MoneyInputFormatter(
                  leadingSymbol: "R\$",
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            InputText(
              keyboardType: TextInputType.datetime,
              label: "Data da compra",
              hint: "Digite dd/mm/aaaa",
              onChanged: (value) => controller.onChanged(
                date: value,
              ),
              validator: (value) =>
                  value.isNotEmpty ? null : "Digite uma data válida!",
              inputFormatters: [
                MaskedInputFormatter(
                  '00/00/0000',
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 20,
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (_, __) => controller.state.when(
                  loading: () => CircularProgressIndicator(),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0),
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
                                        style: AppTheme
                                            .textStyles.buttonBoldTextColor),
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
                  orElse: () => Button(
                        label: "Adicionar",
                        onTap: () {
                          controller.updater();
                        },
                      )),
            )
          ],
        ),
      ),
    );
  }
}
