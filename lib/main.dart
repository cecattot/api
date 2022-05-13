import 'package:flutter/material.dart';
import 'login.dart';
// import 'package:http/http.dart' as http;
// https://developers.google.com/books/docs/v1/using
// import 'dart:convert' as convert;
// import 'package:dio/dio.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Login(),
    theme: ThemeData(primarySwatch: Colors.green),
  ));

  // var url = Uri.parse('http://10.14.20.6/users/login');
  // var response =
  //     await http.post(url, body: {'siape': '1765127', 'serial': '1234567890'});
  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');

  // var url = Uri.http('10.14.20.6', 'users/login');
  // var retorno = await http.get(url);
  // if (retorno.statusCode == 200) {
  //   print(retorno.body);
  // } else {
  //   print("Erro");
  // }
}
