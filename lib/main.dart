import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/register_craftsman.dart';
import 'pages/register_customer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تسجيل الدخول',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/RegisterCustomer': (context) => const RegisterCustomer(),
        '/RegisterCraftsman': (context) => const RegisterCraftsman(),
      },
      home: LessonOne(),
    );
  }
}