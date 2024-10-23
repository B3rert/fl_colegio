import 'package:fl_colegio/models/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsViewModel extends ChangeNotifier {
  CuentaModel? cuenta;
  final List<TransaccionModel> transacciones = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String obtenerNombreMes(int mes) {
    if (mes < 1 || mes > 12) {
      throw ArgumentError('El mes debe estar entre 1 y 12');
    }
    // Crea una fecha usando el año y mes
    DateTime fecha = DateTime(2024, mes); // El año no importa aquí
    // Formatea la fecha para obtener el nombre del mes
    return DateFormat('MMMM', 'es_ES').format(fecha);
  }
}
