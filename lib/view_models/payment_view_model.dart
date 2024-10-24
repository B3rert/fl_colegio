import 'package:fl_colegio/models/models.dart';
import 'package:flutter/material.dart';

class PaymentViewModel extends ChangeNotifier {
  final List<OpcionModel> opciones = [
    OpcionModel(id: 1, nombre: 'Tarjeta de Crédito/Débito'),
    OpcionModel(id: 2, nombre: 'Depósito/Transferencia'),
  ];

  OpcionModel? opcion;

  changeOption(OpcionModel value) {
    opcion = value;
    notifyListeners();
  }
}
