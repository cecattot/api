import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Informações',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(
              Icons.info_outline,
              size: 30,
            ),
            title: Text(
              'Aplicativo desenvolvido em projeto interdisciplinar '
              '(Desenvolvimento de Serviços Web/Desenvolvimento para '
              'Dispositivos Móveis) pelo '
              '5º semestre do Curso Superior de Tecnologia em Análise e '
              'Desenvolvimento de Sistemas, IFMT - Campus Primavera do Leste.',
              // 'Aplicativo desenvolvido como projeto interdisciplinar das disciplinas '
              // 'Desenvolvimento de Serviços Web e Desenvolvimento para '
              // 'Dispositivos Móveis, do curso TADS do IFMT - Primavera do Leste, '
              // 'concluído em junho de 2022.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.people,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              'Desenvolvido por:',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          integrante('Prof. Claudemir Publio Junior'),
          integrante('Prof. Yoji Massago'),
          integrante('Michel Ferracini'),
          integrante('Raul Terrível'),
          integrante('Arlindo Junior'),
          integrante('Danilo Zangado'),
          integrante('João Kleber Presidente'),
          integrante('Jucelio Boa Aula'),
          integrante('Matheus'),
          integrante('Miqueias Paçoca'),
          integrante('Priscila Turista'),
          integrante('Wagner Avast'),
          integrante('Wanderson Barba'),
          const Center(
            child: Text(
              'Junho de 2022'
              '',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
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

  ListTile integrante(String nome) {
    return ListTile(
      leading: const Icon(
        Icons.person,
        size: 22,
        color: Colors.black,
      ),
      title: Text(
        nome,
        style: const TextStyle(
          fontSize: 22,
          color: Colors.black,
        ),
      ),
    );
  }
}
