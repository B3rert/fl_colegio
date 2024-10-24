import 'package:flutter/services.dart';

class ExpirationDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Eliminar cualquier barra existente
    String newText = newValue.text.replaceAll('/', '');

    // Si ya se ingresaron más de 2 dígitos, añadir una barra ("/")
    if (newText.length >= 3) {
      newText = '${newText.substring(0, 2)}/${newText.substring(2)}';
    }

    // Limitar la longitud a 5 caracteres ("MM/YY")
    if (newText.length > 5) {
      newText = newText.substring(0, 5);
    }

    // Devolver el valor formateado manteniendo la posición del cursor
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
