import 'package:fl_colegio/views/views.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeView(),
    'transactions': (BuildContext context) => const TransactionsView(),
    'payment': (BuildContext context) => const PaymentView(),
    // initialRoute: (BuildContext context) => const HomeView(),
    initialRoute: (BuildContext context) => const LoginView(),
  };

  //Ruta por defecto
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) => const HomeView(),
    );
  }
}
