import 'package:flutter/material.dart';
import 'package:tacaro_app/shared/theme/app_text.dart';
import 'package:tacaro_app/shared/theme/app_theme.dart';

class InputText extends StatelessWidget {

  final String label;
  final String hint;
  final bool obscure;
  final void Function(String)? onChanged;
  final String? Function(String)? validator;

  const InputText({
    required this.label, 
    required this.hint,
    this.obscure = false,
    Key? key, 
    this.onChanged, 
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).label,
        SizedBox(
          height: 12,
          ),
        TextFormField(
          obscureText: obscure,
          onChanged: onChanged,
          validator: (value){
            if (validator != null){
              return validator!(value ?? "");
            }
          },
          style: AppTheme.textStyles.input,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTheme.textStyles.hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.colors.border),
              ),
          ),
        ),
      ],
    );
  }
}