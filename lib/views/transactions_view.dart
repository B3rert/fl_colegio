import 'package:fl_colegio/models/models.dart';
import 'package:fl_colegio/theme/app_theme.dart';
import 'package:fl_colegio/view_models/view_models.dart';
import 'package:fl_colegio/views/views.dart';
import 'package:fl_colegio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      symbol:
          "GTQ ", // Símbolo de la moneda (puedes cambiarlo según tu necesidad)
      decimalDigits: 2, // Número de decimales a mostrar
    );

    var textStyleBold = const TextStyle(
      color: AppTheme.secondaryColorDark,
      fontSize: 17,
      fontWeight: FontWeight.bold,
    );

    final TransactionsViewModel vm =
        Provider.of<TransactionsViewModel>(context);
    final PaymentViewModel payVM = Provider.of<PaymentViewModel>(context);
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 100,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Saldo: ${currencyFormat.format(vm.cuenta!.saldo)}",
                        style: textStyleBold.copyWith(
                          color:
                              vm.cuenta!.solvente ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    if (!vm.cuenta!.solvente)
                      Center(
                        child: Text(
                          "Insolvente",
                          style: textStyleBold.copyWith(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    if (vm.cuenta!.solvente)
                      Center(
                        child: Text(
                          "Solvente",
                          style: textStyleBold.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      )
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {},
                  child: ListView.builder(
                    itemCount: vm.transacciones.length,
                    itemBuilder: (BuildContext context, int index) {
                      final TransaccionModel transaccion =
                          vm.transacciones[index];

                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        child: CardHistoryWidget(
                          onTap: () => vm.navigatePayment(context, index),
                          title:
                              "${vm.getNameMonth(transaccion.mes)} ${transaccion.year}",
                          date: transaccion.fechaPago ?? "",
                          transaction: transaccion.pagado,
                          mount: transaccion.monto,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        if (vm.isLoading)
          const ModalBarrier(
            dismissible: false,
            // color: Colors.black.withOpacity(0.3),
            color: AppTheme.backgroundCololorDark,
          ),
        if (vm.isLoading) const LoadView(),
      ],
    );
  }
}
