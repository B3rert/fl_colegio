import 'package:fl_colegio/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PasswordInputWidget extends StatelessWidget {
  const PasswordInputWidget({
    Key? key,
    required this.formProperty,
    required this.formValues,
    required this.obscureText,
    required this.showPassword,
  }) : super(key: key);

  final String formProperty;
  final Map<String, dynamic> formValues;
  final Function showPassword;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.primary,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.primary,
            width: 1.5,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.primary,
            width: 1.5,
          ),
        ),
        hintText: 'Contraseña',
        prefixIcon: const Icon(
          Icons.lock_outline,
          color: AppTheme.primary,
        ),
        suffixIcon: IconButton(
          onPressed: () => showPassword(),
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: AppTheme.primary,
          ),
        ),
      ),
      onChanged: (value) => {
        formValues[formProperty] = value,
      },
      validator: (value) {
        return (value != null && value.length > 0) ? null : 'Campo requerido';
      },
      obscureText: obscureText,
    );
  }
}
