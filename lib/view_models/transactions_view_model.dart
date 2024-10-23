import 'package:fl_colegio/models/models.dart';
import 'package:flutter/material.dart';

class TransactionsViewModel extends ChangeNotifier {
  CuentaModel? cuenta;
  final List<TransaccionModel> transacciones = [];
}
