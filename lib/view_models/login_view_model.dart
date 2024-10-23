// ignore_for_file: use_build_context_synchronously

import 'package:fl_colegio/models/models.dart';
import 'package:fl_colegio/service/notification_service.dart';
import 'package:fl_colegio/service/usuario_service.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  UsuarioModel? usuario;

  //Map form
  final Map<String, String> formValues = {
    'email': '',
    'pass': '',
  };

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //Key for form
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //True if form is valid
  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  bool obscureText = true;

  // Toggles the password show status
  void toggle() {
    obscureText = !obscureText;
    notifyListeners();
  }

  //init Session
  login(BuildContext context) async {
    // Navigator.pushReplacementNamed(context, "home");

    // validate form
    if (!isValidForm()) return;
    //code if valid true

    UsuarioService usuarioService = UsuarioService();

    final LoginModel loginModel = LoginModel(
      user: formValues['email']!,
      password: formValues['pass']!,
    );

    isLoading = true;
    ResponseModel res = await usuarioService.postLogin(loginModel);
    isLoading = false;

    if (!res.success) {
      NotificationsService.showSnackbar("Algo salió mal, intentalo mas tarde");
      return;
    }

    ResponseModel status = ResponseModel.fromMap(res.data);

    if (!status.success) {
      NotificationsService.showSnackbar(status.data);
      return;
    }

    //TODO:Verificar cambio de ocntraseña

    usuario = UsuarioModel.fromMap(status.data);

    // home
    Navigator.pushReplacementNamed(context, "home");
  }

  navigateSignUp(BuildContext context) {
    // Navigator.pushNamed(context, "signup");
  }
}
