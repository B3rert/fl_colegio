import 'package:fl_colegio/theme/app_theme.dart';
import 'package:fl_colegio/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyleBold = const TextStyle(
      color: AppTheme.secondaryColorDark,
      fontSize: 17,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 150,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Saldo: 2,000.00",
                    style: textStyleBold,
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Text(
                    "Insolvente",
                    style: textStyleBold,
                  ),
                ),
                Center(
                  child: Text(
                    "Solvente",
                    style: textStyleBold,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: const CardHistoryWidget(
                      title: "Ad qui minim exercitation incididunt elit est.",
                      date: "01/01/2023",
                      transaction: 1,
                      mount: 100.00,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
