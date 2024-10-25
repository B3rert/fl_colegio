import 'package:fl_colegio/models/models.dart';
import 'package:fl_colegio/service/services.dart';
import 'package:flutter/material.dart';

class PaymentViewModel extends ChangeNotifier {
  final TextEditingController card = TextEditingController(text: "");
  final TextEditingController cvv = TextEditingController(text: "");
  final TextEditingController date = TextEditingController(text: "");
  final TextEditingController name = TextEditingController(text: "");
  final TextEditingController auth = TextEditingController(text: "");

  final List<OpcionModel> opciones = [
    OpcionModel(id: 1, nombre: 'Tarjeta de Crédito/Débito'),
    OpcionModel(id: 2, nombre: 'Depósito/Transferencia'),
  ];

  OpcionModel? opcion;

  confirmPAyment(BuildContext context) {
    if (opcion!.id == 1) {
      if (card.value.text.isEmpty ||
          name.value.text.isEmpty ||
          cvv.value.text.isEmpty ||
          date.value.text.isEmpty) {
        NotificationsService.showSnackbar("Completa todos los datos.");
        return;
      }
    }

    if (opcion!.id == 2) {
      if (auth.value.text.isEmpty) {
        NotificationsService.showSnackbar("Completa todos los datos.");
        return;
      }
    }

    //realizar pago
  }

  changeOption(OpcionModel value) {
    opcion = value;
    notifyListeners();
  }
}
