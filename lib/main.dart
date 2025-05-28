import 'package:flutter/material.dart';
import 'home_page.dart';
import 'about_page.dart';

void main() {
  runApp(DividendCalculatorApp());
}

class DividendCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dividend Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
