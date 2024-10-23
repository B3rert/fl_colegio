import 'dart:convert';

import 'package:fl_colegio/models/models.dart';
import 'package:fl_colegio/providers/providers.dart';
import 'package:http/http.dart' as http;

class TransaccionService {
  final String _baseUrl = ApiProvider().baseUrl;

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
