import 'package:fl_colegio/models/models.dart';
import 'package:fl_colegio/service/notification_service.dart';
import 'package:flutter/material.dart';

class TransactionsViewModel extends ChangeNotifier {
  CuentaModel? cuenta;
  final List<TransaccionModel> transacciones = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  navigatePayment(BuildContext context, TransaccionModel tra) {
    if (tra.pagado) {
      NotificationsService.showSnackbar("Esta transaccion ya fue pagada.");
      return;
    }
    Navigator.pushNamed(context, 'payment');
  }

  String getNameMonth(int mes) {
    final List<String> meses = [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre'
    ];

    if (mes < 1 || mes > 12) {
      throw ArgumentError('El mes debe estar entre 1 y 12');
    }

    return meses[mes - 1]; // Restamos 1 porque la lista es 0-indexed
  }
}
