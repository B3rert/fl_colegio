import 'package:fl_colegio/theme/app_theme.dart';
import 'package:fl_colegio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardHistoryWidget extends StatelessWidget {
  const CardHistoryWidget({
    Key? key,
    required this.title,
    required this.date,
    required this.mount,
    required this.transaction,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String date;
  final double mount;
  final bool transaction; //1 Cargo, 2 Abono
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      symbol:
          "GTQ ", // Símbolo de la moneda (puedes cambiarlo según tu necesidad)
      decimalDigits: 2, // Número de decimales a mostrar
    );

    var titleStyle = const TextStyle(
      fontSize: 17,
      color: AppTheme.primary,
      fontWeight: FontWeight.bold,
    );

    var textStyle = const TextStyle(
      color: AppTheme.secondaryColorDark,
    );

    var textStyleRed = const TextStyle(
      color: Colors.redAccent,
    );
    var textStyleGreen = const TextStyle(
      color: Colors.greenAccent,
    );

    var textStyleBold = const TextStyle(
      color: AppTheme.secondaryColorDark,
      fontSize: 17,
      fontWeight: FontWeight.bold,
    );
    return Cardwidget(
        borderRadius: 20,
        width: double.infinity,
        height: 110,
        content: InkWell(
          onTap: () => onTap(),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title.toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: titleStyle,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        date,
                        style: textStyle,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        transaction ? "Pagado" : "Pendiente",
                        style: textStyleBold,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        currencyFormat.format(mount),
                        style: !transaction ? textStyleRed : textStyleGreen,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
