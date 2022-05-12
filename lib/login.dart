import 'dart:convert';

import 'package:flutter/material.dart';
import 'years.dart';
import 'package:dio/dio.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final siape = TextEditingController();
  final senha = TextEditingController();

  final nome = 'Claudemir Publio Junior';
  final List<int> anos = [
    2022,
    2021,
    2020,
    2019,
    2017,
    2016,
    2015,
    2014,
    2013,
    2012,
    2012,
    2012,
    2012,
    2012,
    2012,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gentr',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 2,
              child: ClipRect(
                child: Image.asset(
                  'images/cpdl.png',
                  height: 80,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                controller: siape,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  labelText: 'Siape',
                  icon: Icon(
                    Icons.people,
                    size: 25,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                controller: senha,
                obscureText: true,
                obscuringCharacter: '*',
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  icon: Icon(
                    Icons.password,
                    size: 25,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                    ),
                    onPressed: () {
                      logar();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Years(
                      //       nomeProf: nome,
                      //       anosCad: anos,
                      //     ),
                      //   ),
                      // );
                    },
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Recuperar senha',
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  logar() async {
    var dio = Dio();
    Response response = await dio.post("http://10.14.20.6/users/login",
      data: {
      'siape': '1765127',
      'password': '123',
      'tipo': 'm'
      }
    );
    if(response.data != null) {
      print('####');
      print(response.data);
      // var a = json.decode(response.data);
    }
  }
}
