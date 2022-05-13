import 'package:flutter/material.dart';
import 'years.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final siape = TextEditingController();
  final senha = TextEditingController();
  var dio = Dio();

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
              elevation: 1,
              child: ClipRect(
                child: Image.asset(
                  'img/logo.png',
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
                    onPressed: () async {
                      var login = await dio
                          .post('http://10.14.20.6/users/login', data: {
                        'siape': siape.text,
                        'password': senha.text,
                        'tipo': 'mb^J@mPrDM',
                      });

                      if (login.data != null) {
                        var jsonLogin = convert.jsonDecode(login.data);

                        var anos = await dio.post(
                          'http://10.14.20.6/mobile/anos',
                          data: {'serial': jsonLogin['serial']},
                        );

                        var jsonAnos = convert.jsonDecode(anos.data);

                        List<int> anosCad = [];
                        for (var item in jsonAnos) {
                          int ano = int.parse(item);
                          anosCad.add(ano);
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Years(
                              nomeProf: jsonLogin['nome'],
                              anosCad: anosCad,
                            ),
                          ),
                        );
                      } else {
                        mensagem();
                      }
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

  void mensagem() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            'Siape ou senha inválidos',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Fechar',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
