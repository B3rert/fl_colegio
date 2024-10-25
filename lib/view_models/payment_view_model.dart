import 'package:fl_colegio/models/models.dart';
import 'package:fl_colegio/service/payment_service.dart';
import 'package:fl_colegio/service/services.dart';
import 'package:flutter/material.dart';

class PaymentViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

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

  confirmPAyment(BuildContext context) async {
    if (opcion!.id == 1) {
      if (card.value.text.isEmpty ||
          name.value.text.isEmpty ||
          cvv.value.text.isEmpty ||
          date.value.text.isEmpty) {
        NotificationsService.showSnackbar("Completa todos los datos.");
        return;
      }

      if (date.value.text.length < 4) {
        NotificationsService.showSnackbar("Fecha invalida");
        return;
      }

      //split text
      final List<String> dateStr = date.value.text.split('/');

      final int month = int.parse(dateStr[0]);
      final int year = int.parse(dateStr[1]);

      if (month > 12) {
        NotificationsService.showSnackbar("Fecha invalida");
        return;
      }

      //Date now?
      DateTime dateTime = DateTime.now();

      // Extract the last two digits of the year
      String yearYY = dateTime.year.toString().substring(2);
      // Format the month to MM
      String monthMM = dateTime.month.toString().padLeft(2, '0');

      if (int.parse(yearYY) < year) {
        NotificationsService.showSnackbar("Tarjeta expirada");
        return;
      }

      if (int.parse(yearYY) == year && int.parse(monthMM) < month) {
        NotificationsService.showSnackbar("Tarjeta expirada");
        return;
      }

      dateTime = DateTime(year, month, dateTime.day);

      //To Do payment proccess
      final PaymentModel paymentModel = PaymentModel(
        cardNumber: card.value.text,
        cvv: cvv.value.text,
        expirationDate: dateTime,
        amount: 500, //TODO:Set Monto
        destinationAccount: "1000000012", //TODO:Set account colege
      );

      PaymentService paymentService = PaymentService();

      isLoading = true;

      final ResponseModel resPaymnet =
          await paymentService.postPayment(paymentModel);

      if (!resPaymnet.success) {
        isLoading = false;

        NotificationsService.showSnackbar(resPaymnet.data["data"]);
        return;
      }

      final List<PaymentModel> paymnetsSucces = [];

      for (var element in resPaymnet.data["data"]) {
        paymnetsSucces.add(PaymentModel.fromMap(element));
      }

      if (paymnetsSucces.isEmpty) {
        isLoading = false;

        NotificationsService.showSnackbar("Transaccion invalida");
        return;
      }

      //set transaction in dbCol

      //TODO:Dialog confirm tra

      isLoading = false;
    }

    if (opcion!.id == 2) {
      if (auth.value.text.isEmpty) {
        NotificationsService.showSnackbar("Completa todos los datos.");
        return;
      }
    }

    //realizar pago tarjeta
    if (opcion!.id == 1) {
      print(date.value.text);
      // PaymentModel paymentModel = PaymentModel(
      //   cardNumber: cardNumber,
      //   cvv: cvv,
      //   expirationDate: expirationDate,
      //   amount: amount,
      //   destinationAccount: destinationAccount,
      // );
    }
  }

  changeOption(OpcionModel value) {
    opcion = value;
    notifyListeners();
  }
}
