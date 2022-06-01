import 'package:flutter/material.dart';
import 'login.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Login(),
    theme: ThemeData(primarySwatch: Colors.green),
  ));
}
