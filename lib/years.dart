import 'package:flutter/material.dart';
import 'package:gentr/documents.dart';

class Years extends StatefulWidget {
  final String nomeProf;
  final List<int> anosCad;
  const Years({
    Key? key,
    required this.nomeProf,
    required this.anosCad,
  }) : super(key: key);

  @override
  State<Years> createState() => _YearsState();
}

class _YearsState extends State<Years> {
  List<String> anual = [
    'PIT',
    'Plano de Ensino',
    'Diário',
    'Diário',
    'Diário',
    'Diário',
    'Diário',
    'Diário',
    'Diário',
    'Diário',
    'Diário',
    'Diário',
    'Diário',
    'Diário',
    'Diário',
  ];
  List<String> sem1 = [
    'Documento 1',
    'Documento 2',
    'Documento 3',
    'Documento 4',
    'Documento 4',
    'Documento 4',
    'Documento 4',
    'Documento 4',
    'Documento 4',
    'Documento 4',
    'Documento 4',
    'Documento 4',
    'Documento 4',
    'Documento 4',
    'Documento 4',
  ];
  List<String> sem2 = [
    'Documento 1',
    'Documento 2',
    'Documento 3',
    'Documento 4',
    'Documento 5',
    'Documento 5',
    'Documento 5',
    'Documento 5',
    'Documento 5',
    'Documento 5',
    'Documento 5',
    'Documento 5',
    'Documento 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prof. ' + widget.nomeProf,
          style: const TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: listar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget listar() {
    return ListView.builder(
      itemCount: widget.anosCad.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Documents(
                    anual: anual,
                    semestre1: sem1,
                    semestre2: sem2,
                  ),
                ),
              );
            },
            child: Material(
              elevation: 1,
              child: ListTile(
                title: Text(
                  widget.anosCad[index].toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
                trailing: const Icon(
                  Icons.remove_red_eye,
                  size: 22,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
