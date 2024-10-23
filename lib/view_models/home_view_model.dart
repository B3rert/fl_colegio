import 'package:fl_colegio/service/cuenta_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> navigateStatusAccount() async {
    CuentaService cuentaService = CuentaService();

    isLoading = true;

    isLoading = false;
  }
}
