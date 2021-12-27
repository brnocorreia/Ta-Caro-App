import 'package:flutter/material.dart';
import 'package:tacaro_app/shared/theme/app_theme.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    Key? key,
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
              "12/12",
              style: AppTheme.textStyles.label,
            ),
          ),
          title: Text(
            "Produto",
            style: AppTheme.textStyles.titleListTile,
          ),
          subtitle: Text(
            "Preço",
            style: AppTheme.textStyles.subtitleListTile,
          ),
          trailing: PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: Text(
                "Editar",
                style: AppTheme.textStyles.titleListTile,
              )),
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
