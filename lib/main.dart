
import 'package:flutter/material.dart';
import 'package:api/login.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Login(),
    theme: ThemeData(primarySwatch: Colors.green),
  ));
}