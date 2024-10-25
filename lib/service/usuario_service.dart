import 'dart:convert';

import 'package:fl_colegio/models/login_model.dart';
import 'package:fl_colegio/models/response_model.dart';
import 'package:fl_colegio/providers/providers.dart';
import 'package:http/http.dart' as http;

class UsuarioService {
  final String _baseUrl = ApiProvider().baseUrlColegio;

  Future<ResponseModel> postLogin(LoginModel login) async {
    final url =
        Uri.parse('${_baseUrl}User/login'); // Reemplaza con tu URL de API

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: login.toJson(),
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
