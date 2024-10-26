import 'dart:convert';

import 'package:fl_colegio/models/models.dart';
import 'package:fl_colegio/models/put_payment_model.dart';
import 'package:fl_colegio/providers/providers.dart';
import 'package:http/http.dart' as http;

class TransaccionService {
  final String _baseUrl = ApiProvider().baseUrlColegio;

  Future<ResponseModel> validateTransaction(String autorizacion) async {
    final url = Uri.parse(
        '${_baseUrl}Transaction/validar/$autorizacion'); // Reemplaza con tu URL de API

    try {
      final response = await http.get(
        url,
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // La petición fue exitosa
        return ResponseModel(success: true, data: data);
      } else {
        // Hubo un error en la petición
        return ResponseModel(success: false, data: data);
      }
    } catch (e) {
      return ResponseModel(success: false, data: e);
    }
  }

  Future<ResponseModel> postPayment(PutPaymentTraModel payment) async {
    final url =
        Uri.parse('${_baseUrl}Transaction/pago'); // Reemplaza con tu URL de API

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: payment.toJson(),
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // La petición fue exitosa
        return ResponseModel(success: true, data: data);
      } else {
        // Hubo un error en la petición
        return ResponseModel(success: false, data: data);
      }
    } catch (e) {
      return ResponseModel(success: false, data: e);
    }
  }

  Future<ResponseModel> getTransactions(int idCuenta) async {
    final url = Uri.parse(
        '${_baseUrl}Transaction/$idCuenta'); // Reemplaza con tu URL de API

    try {
      final response = await http.get(
        url,
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // La petición fue exitosa
        return ResponseModel(success: true, data: data);
      } else {
        // Hubo un error en la petición
        return ResponseModel(success: false, data: data);
      }
    } catch (e) {
      return ResponseModel(success: false, data: e);
    }
  }
}
