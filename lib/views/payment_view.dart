import 'package:fl_colegio/models/models.dart';
import 'package:fl_colegio/theme/app_theme.dart';
import 'package:fl_colegio/utilities/card_number_input_formatter.dart';
import 'package:fl_colegio/utilities/expiration_date_input_formatter.dart';
import 'package:fl_colegio/view_models/view_models.dart';
import 'package:fl_colegio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  void initState() {
    super.initState();
    final PaymentViewModel vm = Provider.of<PaymentViewModel>(
      context,
      listen: false,
    );

    vm.opcion = vm.opciones.first;
  }

  var textStyleBold = const TextStyle(
    color: AppTheme.secondaryColorDark,
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  final currencyFormat = NumberFormat.currency(
    symbol:
        "GTQ ", // Símbolo de la moneda (puedes cambiarlo según tu necesidad)
    decimalDigits: 2, // Número de decimales a mostrar
  );

  var titleStyle = const TextStyle(
    color: AppTheme.primary,
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  var textStyle = const TextStyle(
    color: AppTheme.secondaryColorDark,
  );

  @override
  Widget build(BuildContext context) {
    final PaymentViewModel vm = Provider.of<PaymentViewModel>(context);
    final TransactionsViewModel traVM =
        Provider.of<TransactionsViewModel>(context);

    int indexTra = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Total a pagar: ${currencyFormat.format(traVM.transacciones[indexTra].monto)}",
                  style: textStyleBold,
                ),
              ),
              const SizedBox(height: 10),
              Cardwidget(
                borderRadius: 20,
                width: double.infinity,
                height: 120,
                content: Column(
                  children: [
                    ...vm.opciones.map(
                      (opcion) => RadioListTile<OpcionModel>(
                        title: Text(opcion.nombre),
                        value:
                            opcion, // Usamos el nombre en minúsculas como valor
                        groupValue: vm.opcion,
                        onChanged: (value) => vm.changeOption(value!),
                        activeColor: AppTheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              if (vm.opcion!.id == 1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Numero de la tarjeta",
                        style: titleStyle,
                      ),
                    ),
                    Cardwidget(
                      borderRadius: 20,
                      width: double.infinity,
                      height: 100,
                      content: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              cursorColor: AppTheme.primary,
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly, // Permite solo dígitos
                                CardNumberInputFormatter(), // Formateador personalizado
                              ],
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: "0000 0000 0000 0000",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              controller: vm.card,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "Nombre del titular",
                        style: titleStyle,
                      ),
                    ),
                    Cardwidget(
                      borderRadius: 20,
                      width: double.infinity,
                      height: 100,
                      content: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              cursorColor: AppTheme.primary,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                hintText: "Como aparece en la tarjeta",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              controller: vm.name,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "Fecha de expiración",
                        style: titleStyle,
                      ),
                    ),
                    Cardwidget(
                      borderRadius: 20,
                      width: double.infinity,
                      height: 100,
                      content: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              cursorColor: AppTheme.primary,
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly, // Solo dígitos permitidos
                                ExpirationDateInputFormatter(), // Formateador personalizado MM/YY
                              ],
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: "MM/YY",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              controller: vm.date,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "Codigo de seguridad",
                        style: titleStyle,
                      ),
                    ),
                    Cardwidget(
                      borderRadius: 20,
                      width: double.infinity,
                      height: 100,
                      content: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              cursorColor: AppTheme.primary,
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly, // Solo dígitos permitidos
                              ],
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: "CVV",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              controller: vm.cvv,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              if (vm.opcion!.id == 2)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Numero de autorización",
                        style: titleStyle,
                      ),
                    ),
                    Cardwidget(
                      borderRadius: 20,
                      width: double.infinity,
                      height: 100,
                      content: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              cursorColor: AppTheme.primary,
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly, // Solo dígitos permitidos
                              ],
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: "Ver boleta",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              controller: vm.auth,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              GradientButtonWidget(
                radius: 22,
                onTap: () => vm.confirmPAyment(context, indexTra),
                text: "Confirmar pago",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
