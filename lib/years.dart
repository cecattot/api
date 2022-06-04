import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gentr/documents.dart';
import 'dart:convert' as convert;
import 'login.dart';

class Years extends StatefulWidget {
  final String nomeProf;
  final List<int> anosCad;
  final String serialCadastrado;

  const Years({
    Key? key,
    required this.nomeProf,
    required this.anosCad,
    required this.serialCadastrado,
  }) : super(key: key);

  @override
  State<Years> createState() => _YearsState();
}

class _YearsState extends State<Years> {
  List<String> tipoDoc = [
    'PIT',
    'Plano de Ensino',
    'Diário Consolidado',
    'Conteúdo'
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.anosCad.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Prof. ' + widget.nomeProf,
            style: const TextStyle(fontSize: 25),
          ),
          automaticallyImplyLeading: false,
        ),
        body: const Center(
          child: Text(
            'Não há registros.',
            style: TextStyle(fontSize: 25),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 222, 105, 66),
          child: const Icon(Icons.undo_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Prof. ' + widget.nomeProf,
            style: const TextStyle(fontSize: 25),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: listarAnos(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 222, 105, 66),
          child: const Icon(Icons.undo_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    }
  }

  Widget listarAnos() {
    return ListView.builder(
      itemCount: widget.anosCad.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.red[50],
          elevation: 1,
          child: ExpansionTile(
            title: Text(
              widget.anosCad[index].toString(),
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            children: [
              SizedBox(
                child: ListView.builder(
                  itemCount: tipoDoc.length,
                  itemBuilder: (context, indice) {
                    return documentos(indice, widget.anosCad[index].toString());
                  },
                ),
                height: 0.35 * MediaQuery.of(context).size.height,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget documentos(int indice, String ano) {
    return Card(
      elevation: 1,
      child: Material(
        elevation: 1,
        child: ListTile(
          title: Text(
            tipoDoc[indice],
            style: const TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          trailing: GestureDetector(
            child: const Icon(
              Icons.remove_red_eye,
              size: 22,
              color: Color.fromARGB(255, 222, 105, 66),
            ),
            onTap: () async {
              var dio = Dio();

              var resposta = await dio.post(
                // 'http://10.0.2.2:8765/mobile/lista',
                'http://jsdteste.tk/mobile/lista',
                data: {
                  'ano': ano,
                  'busca': indice + 1,
                  'serial': widget.serialCadastrado,
                },
              );

              List<dynamic> docsCad = [];

              if (resposta.data == '[]') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Documents(
                      tipoDocumento: tipoDoc[indice],
                      listaDocumentos: docsCad,
                      anoPesquisado: ano,
                    ),
                  ),
                );
              } else {
                var jsonResposta = convert.jsonDecode(resposta.data);

                if (jsonResposta[0] != 'Erro') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Documents(
                        tipoDocumento: tipoDoc[indice],
                        listaDocumentos: jsonResposta,
                        anoPesquisado: ano,
                      ),
                    ),
                  );
                } else {
                  mensagem(jsonResposta[1], jsonResposta[2].toString());
                }
              }
            },
          ),
        ),
      ),
    );
  }

  void mensagem(String msg, String vlr) {
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
                if (vlr == '1') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
