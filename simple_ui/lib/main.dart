import 'package:flutter/material.dart';
import 'package:simple_ui/screens/home_page.dart';
import 'package:simple_ui/screens/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Ui',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.amber,
          iconTheme: const IconThemeData(color: Colors.white)),
      home: SplashPage(),
    );
  }
}
