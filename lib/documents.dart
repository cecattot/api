import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Documents extends StatefulWidget {
  final String tipoDocumento;
  final List<dynamic> listaDocumentos;
  final String anoPesquisado;
  const Documents({
    Key? key,
    required this.tipoDocumento,
    required this.listaDocumentos,
    required this.anoPesquisado,
  }) : super(key: key);

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.tipoDocumento + " - " + widget.anoPesquisado,
          style: const TextStyle(fontSize: 25),
        ),
      ),
      body: listar(widget.listaDocumentos),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.undo_sharp),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget listar(List<dynamic> lista) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          child: ListTile(
            title: Text(
              lista[index]['descricao'],
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            trailing: GestureDetector(
              child: const Icon(
                Icons.link,
                size: 22,
                color: Colors.red,
              ),
              onTap: () async {
                var _url = Uri.parse(lista[index]['caminho']);
                await launchUrl(_url);
              },
            ),
          ),
        );
      },
    );
  }
}
