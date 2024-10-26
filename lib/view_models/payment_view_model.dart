// ignore_for_file: use_build_context_synchronously

import 'package:fl_colegio/models/models.dart';
import 'package:fl_colegio/models/put_payment_model.dart';
import 'package:fl_colegio/service/payment_service.dart';
import 'package:fl_colegio/service/services.dart';
import 'package:fl_colegio/view_models/view_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  confirmPAyment(
    BuildContext context,
    int indexTra,
  ) async {
    final TransactionsViewModel traVM = Provider.of<TransactionsViewModel>(
      context,
      listen: false,
    );

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

      if (year < int.parse(yearYY)) {
        NotificationsService.showSnackbar("Tarjeta expirada");
        return;
      }

      if (int.parse(yearYY) == year && month < int.parse(monthMM)) {
        NotificationsService.showSnackbar("Tarjeta expirada");
        return;
      }

      //To Do payment proccess
      final PaymentModel paymentModel = PaymentModel(
        cardNumber: card.value.text.replaceAll(" ", ""), //QUITAR ESPACIOS?
        cvv: cvv.value.text,
        expirationDate: "${year + 2000}-$month-01",
        amount: traVM.transacciones[indexTra].monto,
        destinationAccount: "1000000014", //TODO:Set account colege
      );

      PaymentService paymentService = PaymentService();

      isLoading = true;

      final ResponseModel resPaymnet =
          await paymentService.postPayment(paymentModel);

      if (!resPaymnet.success) {
        print("aqui me quedo");
        NotificationsService.showSnackbar(resPaymnet.data["data"]);
        return;
      }

      final List<TransactionBankModel> paymnetsSucces = [];

      for (var element in resPaymnet.data["data"]) {
        paymnetsSucces.add(TransactionBankModel.fromMap(element));
      }

      if (paymnetsSucces.isEmpty) {
        isLoading = false;

        NotificationsService.showSnackbar("Transaccion invalida");
        return;
      }

      //set transaction in dbColegio

      final PutPaymentTraModel putPayment = PutPaymentTraModel(
        traId: traVM.transacciones[indexTra].id, //asignar valor
        autorizacion: paymnetsSucces.first.numeroAutorizacion,
      );

      final TransaccionService transaccionService = TransaccionService();

      final ResponseModel resRegisterPayment =
          await transaccionService.postPayment(putPayment);

      if (!resRegisterPayment.success) {
        isLoading = false;
        NotificationsService.showSnackbar(resRegisterPayment.data["data"]);
        return;
      }

      final TransaccionModel traColegio =
          TransaccionModel.fromMap(resRegisterPayment.data["data"]);
      traVM.transacciones[indexTra] = traColegio;

      traVM.cuenta!.saldo = traVM.cuenta!.saldo - traColegio.monto;

      NotificationsService.showSnackbar(
          "Pago realizado. No. Autorizacion: ${paymnetsSucces.first.numeroAutorizacion}");

      isLoading = false;
    }

    if (opcion!.id == 2) {
      if (auth.value.text.isEmpty) {
        NotificationsService.showSnackbar("Completa todos los datos.");
        return;
      }

      isLoading = true;

      final PaymentService paymentService = PaymentService();

      final ResponseModel resValidAuth =
          await paymentService.getTransaction(auth.value.text);

      if (!resValidAuth.success) {
        isLoading = false;
        NotificationsService.showSnackbar("Algo salió mal");
        return;
      }

      if (resValidAuth.data["data"].isEmpty) {
        isLoading = false;
        NotificationsService.showSnackbar(
            "Numero de autorizacion no es valido.");
        return;
      }

      final TransactionBankModel traAuth =
          TransactionBankModel.fromMap(resValidAuth.data["data"].first);

      if (traAuth.monto < traVM.transacciones[indexTra].monto) {
        isLoading = false;
        NotificationsService.showSnackbar(
            "El monto de la transacion no es valido.");
        return;
      }

      final TransaccionService transaccionService = TransaccionService();

      final ResponseModel validateTraCole =
          await transaccionService.validateTransaction(auth.value.text);

      if (!validateTraCole.success) {
        isLoading = false;
        NotificationsService.showSnackbar(validateTraCole.data["data"]);
        return;
      }

//set transaction in dbColegio

      final PutPaymentTraModel putPayment = PutPaymentTraModel(
        traId: traVM.transacciones[indexTra].id, //asignar valor
        autorizacion: auth.value.text,
      );

      final ResponseModel resRegisterPayment =
          await transaccionService.postPayment(putPayment);

      if (!resRegisterPayment.success) {
        isLoading = false;
        NotificationsService.showSnackbar(resRegisterPayment.data["data"]);
        return;
      }

      final TransaccionModel traColegio =
          TransaccionModel.fromMap(resRegisterPayment.data["data"]);
      traVM.transacciones[indexTra] = traColegio;

      traVM.cuenta!.saldo = traVM.cuenta!.saldo - traColegio.monto;

      NotificationsService.showSnackbar("Pago realizado.");

      isLoading = false;
    }

    isLoading = false;

    //limpiar campos
    card.text = "";
    name.text = "";
    date.text = "";
    cvv.text = "";
    auth.text = "";

    //Salir de la pantalla
    Navigator.pop(context);
  }

  changeOption(OpcionModel value) {
    opcion = value;
    notifyListeners();
  }
}
