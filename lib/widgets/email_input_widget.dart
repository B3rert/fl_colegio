import 'package:fl_colegio/theme/app_theme.dart';
import 'package:flutter/material.dart';

class EmailInputWidget extends StatelessWidget {
  const EmailInputWidget({
    Key? key,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  final String formProperty;
  final Map<String, dynamic> formValues;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppTheme.primary,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.primary,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.primary,
            width: 1.5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.primary,
            width: 1.5,
          ),
        ),
        hintText: "Correo",
        prefixIcon: Icon(
          Icons.email_outlined,
          color: AppTheme.primary,
        ),
      ),
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        String pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = RegExp(pattern);

        return regExp.hasMatch(value ?? '') ? null : 'Correo incorrecto.';
      },
    );
  }
}
