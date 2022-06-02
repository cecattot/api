import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:api/newPassword.dart';
import 'dart:convert' as convert;

class Check extends StatefulWidget {
  final String emailDigitado;
  const Check({Key? key, required this.emailDigitado}) : super(key: key);

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  final code = TextEditingController();

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
              'Código de Confirmação',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                controller: code,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  labelText: 'Código',
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
                      var dio = Dio();

                      var resposta = await dio.post(
                        // 'http://10.0.2.2:8765/mobile/check',
                        'http://jsdteste.tk/mobile/check',
                        data: {
                          'check': code.text,
                          'email': widget.emailDigitado,
                        },
                      );

                      if (resposta.data != null) {
                        var jsonResposta = convert.jsonDecode(resposta.data);

                        if (jsonResposta[0] != 'Erro') {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewPassword(
                                emailDigitado: widget.emailDigitado,
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
