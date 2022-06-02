import 'package:flutter/material.dart';
import 'package:api/years.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'package:api/main.dart';


import 'recover.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final siape = TextEditingController();
  final senha = TextEditingController();

  @override
  void initState() {
    inicializar();
    super.initState();
  }

  void inicializar() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    siape.text = (pref.getString("siape") ?? '');
    senha.text = (pref.getString("senha") ?? '');
    setState(() {
      siape.text;
      senha.text;
    });
  }

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
                keyboardType: TextInputType.number,
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
                      var dio = Dio();

                      var login = await dio.post(
                        // 'http://10.0.2.2:8765/users/login',
                        'http://jsdteste.tk/users/login',
                        data: {
                          'siape': siape.text,
                          'password': senha.text,
                          'tipo': 'mb^J@mPrDM',
                        },
                      );

                      if (login.data != null) {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        await pref.setString("siape", siape.text);
                        await pref.setString("senha", senha.text);

                        var jsonLogin = convert.jsonDecode(login.data);

                        if (jsonLogin['nome'] != 'Erro') {
                          var anos = await dio.post(
                            // 'http://10.0.2.2:8765/mobile/anos',
                            'http://jsdteste.tk/mobile/anos',
                            data: {
                              'serial': jsonLogin['serial'],
                            },
                          );

                          List<int> anosCad = [];

                          if (anos.data == '[]') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Years(
                                  nomeProf: jsonLogin['nome'],
                                  anosCad: anosCad,
                                  serialCadastrado: jsonLogin['serial'],
                                ),
                              ),
                            );
                          } else {
                            var jsonAnos = convert.jsonDecode(anos.data);

                            if (jsonAnos[0] != 'Erro') {
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
                                    serialCadastrado: jsonLogin['serial'],
                                  ),
                                ),
                              );
                            } else {
                              mensagem(jsonAnos);
                            }
                          }
                        } else {
                          mensagem(jsonLogin['serial']);
                        }
                      } else {
                        //erro no login.data
                        mensagem('Erro na requisição');
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Recover(),
                          ),
                        );
                      },
                      child: const Text(
                        'Recuperar senha',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  AlertDialog mensagem(String msg) {
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
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
