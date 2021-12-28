import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_multi_formatter/formatters/money_input_formatter.dart';
import 'package:tacaro_app/modules/create/create_controller.dart';
import 'package:tacaro_app/modules/create/respositories/create_repository_impl.dart';
import 'package:tacaro_app/shared/services/app_database.dart';
import 'package:tacaro_app/shared/widgets/button.dart';
import 'package:tacaro_app/shared/widgets/input_text.dart';

class CreateBottomSheet extends StatefulWidget {
  const CreateBottomSheet({Key? key}) : super(key: key);

  @override
  State<CreateBottomSheet> createState() => _CreateBottomSheetState();
}

class _CreateBottomSheetState extends State<CreateBottomSheet> {
  late final CreateController controller;

  @override
  void initState() {
    controller = CreateController(
        repository: CreateRepositoryImpl(database: AppDatabase.instance));
    super.initState();
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
            Button(
                label: "Adicionar",
                onTap: () {
                  controller.create();
                })
          ],
        ),
      ),
    );
  }
}
