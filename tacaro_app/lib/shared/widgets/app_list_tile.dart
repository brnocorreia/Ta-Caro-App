import 'package:flutter/material.dart';
import 'package:tacaro_app/modules/update/update_bottom_sheet.dart';
import 'package:tacaro_app/shared/models/order_model.dart';
import 'package:tacaro_app/shared/theme/app_theme.dart';

class AppListTile extends StatelessWidget {
  final OrderModel order;

  const AppListTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.colors.textEnabled,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppTheme.colors.background,
            radius: 30,
            child: Text(
              order.created.split("-").sublist(1).reversed.join("/"),
              style: AppTheme.textStyles.label,
            ),
          ),
          title: Text(
            order.name,
            style: AppTheme.textStyles.titleListTile,
          ),
          subtitle: Text(
            "R\$ ${order.price.toStringAsFixed(2).replaceAll(".", ",")}",
            style: AppTheme.textStyles.subtitleListTile,
          ),
          trailing: PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "Editar",
                  style: AppTheme.textStyles.titleListTile,
                ),
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32))),
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: UpdateBottomSheet(),
                    ),
                  );
                },
              ),
              PopupMenuItem(
                  child: Text(
                "Excluir",
                style: AppTheme.textStyles.titleListTile,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
