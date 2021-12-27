import 'package:flutter/material.dart';
import 'package:tacaro_app/shared/theme/app_theme.dart';

class AppBottomNavigator extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const AppBottomNavigator({
    Key? key,
    required this.currentIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26.0, left: 26.0, bottom: 14.0),
      child: Container(
        height: 76,
        decoration: BoxDecoration(
            color: AppTheme.colors.textEnabled,
            borderRadius: BorderRadius.circular(10)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconBottomNavigator(
            onTap: () {
              onChanged(0);
            },
            enabled: currentIndex == 0,
            icon: Icons.home,
          ),
          IconBottomNavigator(
            onTap: () {
              onChanged(3);
            },
            enabled: false,
            icon: Icons.add,
          ),
          IconBottomNavigator(
            onTap: () {
              onChanged(1);
            },
            enabled: currentIndex == 1,
            icon: Icons.settings,
          ),
        ]),
      ),
    );
  }
}

class IconBottomNavigator extends StatelessWidget {
  final bool enabled;
  final Function() onTap;
  final IconData icon;

  const IconBottomNavigator({
    Key? key,
    required this.onTap,
    required this.enabled,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        child: Icon(
          icon,
          color: enabled
              ? AppTheme.colors.textEnabled
              : AppTheme.colors.iconInactive,
        ),
        decoration: BoxDecoration(
            color:
                enabled ? AppTheme.colors.primary : AppTheme.colors.background,
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
