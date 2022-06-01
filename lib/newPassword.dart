import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'login.dart';

class NewPassword extends StatefulWidget {
  final String emailDigitado;
  const NewPassword({Key? key, required this.emailDigitado}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final password = TextEditingController();
  final confirm = TextEditingController();
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
              'Nova Senha',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                controller: password,
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
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                controller: confirm,
                obscureText: true,
                obscuringCharacter: '*',
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  labelText: 'Confirmação',
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
                      if (password.text == confirm.text) {
                        var dio = Dio();
                        var resposta = await dio.post(
                          'http://jsdteste.tk/mobile/newpassword',
                          data: {
                            'email': widget.emailDigitado,
                            'password': password.text,
                            'confirmPassword': confirm.text,
                          },
                        );
                        if (resposta.data != null) {
                          var jsonResposta = convert.jsonDecode(resposta.data);

                          if (jsonResposta[0] != 'Erro') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          } else {
                            mensagem(jsonResposta[1]);
                          }
                        } else {
                          mensagem('Erro na requisição');
                        }
                      } else {
                        String msg = 'As senhas não conferem';
                        mensagem(msg);
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
