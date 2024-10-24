import 'package:fl_colegio/models/models.dart';
import 'package:fl_colegio/view_models/view_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PaymentViewModel vm = Provider.of<PaymentViewModel>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ...vm.opciones.map((opcion) => RadioListTile<OpcionModel>(
                  title: Text(opcion.nombre),
                  value: opcion, // Usamos el nombre en minúsculas como valor
                  groupValue: vm.opcion,
                  onChanged: (value) {},
                )),
          ],
        ),
      ),
    ));
  }
}
