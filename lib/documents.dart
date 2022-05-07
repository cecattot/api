import 'package:flutter/material.dart';

class Documents extends StatefulWidget {
  final List<String> anual;
  final List<String> semestre1;
  final List<String> semestre2;
  const Documents(
      {Key? key,
      required this.anual,
      required this.semestre1,
      required this.semestre2})
      : super(key: key);

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Documentos',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: ListView(
        children: [
          Card(
            elevation: 2,
            color: Colors.green[50],
            child: ExpansionTile(
              title: const Text('Anual', style: TextStyle(fontSize: 25)),
              children: [
                SizedBox(
                  height: 0.9 * MediaQuery.of(context).size.height,
                  child: listar(widget.anual),
                )
              ],
            ),
          ),
          Card(
            elevation: 2,
            color: Colors.green[50],
            child: ExpansionTile(
              title: const Text('1º Semestre', style: TextStyle(fontSize: 25)),
              children: [
                SizedBox(
                  height: 0.9 * MediaQuery.of(context).size.height,
                  child: listar(widget.semestre1),
                )
              ],
            ),
          ),
          Card(
            elevation: 2,
            color: Colors.green[50],
            child: ExpansionTile(
              title: const Text('2º Semestre', style: TextStyle(fontSize: 25)),
              children: [
                SizedBox(
                  height: 0.9 * MediaQuery.of(context).size.height,
                  child: listar(widget.semestre2),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.undo_sharp),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget listar(List<String> lista) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          child: ListTile(
            title: Text(
              lista[index].toString(),
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.link,
              size: 20,
              color: Colors.black,
            ),
            onTap: () {},
          ),
        );
      },
    );
  }
}
