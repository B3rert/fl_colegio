import 'package:fl_colegio/models/models.dart';
import 'package:flutter/material.dart';

class PaymentViewModel extends ChangeNotifier {
  final List<OpcionModel> opciones = [
    OpcionModel(id: 1, nombre: 'Tarjeta'),
    OpcionModel(id: 2, nombre: 'Depósito'),
  ];

  OpcionModel? opcion;
}
