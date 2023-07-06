import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const BMICALCULATOR());
}

class BMICALCULATOR extends StatelessWidget {
  const BMICALCULATOR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF0F0F1E),
        ),
        scaffoldBackgroundColor: Color(0xFF0F0F1E),
      ),
      home: InputPage(),
    );
  }
}


