// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'app_theme.dart';

extension TextExt on Text{
  Text get label => Text(
    this.data!,
    style: AppTheme.textStyles.label,
  );

}