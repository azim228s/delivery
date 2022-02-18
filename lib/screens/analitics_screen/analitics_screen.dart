import 'package:flutter/material.dart';

class AnaliticsScreen extends StatelessWidget {
  const AnaliticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analitics"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
    );
  }
}
