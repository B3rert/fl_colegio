// ignore_for_file: use_build_context_synchronously

import 'package:fl_colegio/models/models.dart';
import 'package:fl_colegio/service/cuenta_service.dart';
import 'package:fl_colegio/service/notification_service.dart';
import 'package:fl_colegio/service/services.dart';
import 'package:fl_colegio/view_models/view_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> navigateStatusAccount(BuildContext context) async {
    final LoginViewModel loginVM = Provider.of<LoginViewModel>(
      context,
      listen: false,
    );
    final TransactionsViewModel traVM = Provider.of<TransactionsViewModel>(
      context,
      listen: false,
    );
    CuentaService cuentaService = CuentaService();

    isLoading = true;

    ResponseModel resCuenta = await cuentaService.getCuneta(
      loginVM.usuario!.id,
    );

    if (!resCuenta.success) {
      isLoading = false;

      NotificationsService.showSnackbar(
        "No hay cuenta asignada a este usuario",
      );

      return;
    }

    traVM.cuenta = CuentaModel.fromMap(resCuenta.data["data"]);

    //cargar transacciones
    TransaccionService transaccionService = TransaccionService();

    ResponseModel resTra = await transaccionService.getTransactions(
      traVM.cuenta!.id,
    );

    if (!resTra.success) {
      isLoading = false;
      NotificationsService.showSnackbar(
        "No hay transacciones para esta cuenta",
      );

      return;
    }

    for (var element in resTra.data["data"]) {
      traVM.transacciones.add(TransaccionModel.fromMap(element));
    }

    Navigator.pushNamed(context, "transactions");

    isLoading = false;
  }
}
