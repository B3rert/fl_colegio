import 'package:fl_colegio/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return const CardHistoryWidget(
            title: "Ad qui minim exercitation incididunt elit est.",
            date: "01/01/2023",
            transaction: 1,
            mount: 100.00,
          );
        },
      ),
    );
  }
}
