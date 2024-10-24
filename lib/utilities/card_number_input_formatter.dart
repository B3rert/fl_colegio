import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Eliminar los espacios en el valor nuevo
    String newText = newValue.text.replaceAll(' ', '');

    // Crear una nueva cadena separando cada 4 dígitos con un espacio
    String formattedText = '';
    for (int i = 0; i < newText.length; i++) {
      if (i % 4 == 0 && i != 0) {
        formattedText += ' '; // Insertar un espacio cada 4 dígitos
      }
      formattedText += newText[i];
    }

    // Devolver el valor formateado manteniendo la posición del cursor
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
