import 'package:flutter/material.dart';

class LoadView extends StatelessWidget {
  const LoadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleStyle = const TextStyle(
      fontSize: 22,
      color: Colors.blueGrey,
      fontWeight: FontWeight.bold,
    );

    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: _size.height * 0.20),
              Image.asset(
                "assets/load.gif",
                height: 300,
              ),
              Text(
                "Cargando.",
                style: titleStyle,
              ),
              const SizedBox(height: 10),
              Text(
                "Por favor espere.",
                style: titleStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
