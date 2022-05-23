import 'package:flutter/material.dart';
import 'package:gentr/check.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;

class Recover extends StatefulWidget {
  const Recover({Key? key}) : super(key: key);

  @override
  State<Recover> createState() => _LoginState();
}

class _LoginState extends State<Recover> {
  final email = TextEditingController();

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
              'Recuperação de Senha',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                controller: email,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  icon: Icon(
                    Icons.people,
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
                      final dio = Dio();
                      var resposta = await dio.post(
                        'http://jsdteste.tk/mobile/recover',
                        data: {
                          'email': email.text,
                        },
                      );

                      if (resposta.data != null) {
                        var jsonResposta = convert.jsonDecode(resposta.data);

                        if (jsonResposta[0] != 'Erro') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Check(
                                emailDigitado: email.text,
                              ),
                            ),
                          );
                        } else {
                          mensagem(jsonResposta[1]);
                        }
                      } else {
                        mensagem('Erro na requisição');
                      }
                    },
                    child: const Text(
                      "Enviar",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void mensagem(String msg) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            msg,
            style: const TextStyle(
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
