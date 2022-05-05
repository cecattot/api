import 'package:flutter/material.dart';
import 'relatorio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(myFirst(servidor: 'Yoji Massago'));
}

class myFirst extends StatelessWidget {
  myFirst({Key? key, required this.servidor}) : super(key: key);
  final String servidor;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nome do Servidor',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: myFirstPage(title: "$servidor"),
    );
  }
}

class myFirstPage extends StatefulWidget {
  const myFirstPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<myFirstPage> createState() => _myFirstPageState();
}

class _myFirstPageState extends State<myFirstPage> {
  List<String> anos = [
    '2020',
    '2019',
    '2018',
    '2017',
    '2020',
    '2019',
    '2018',
    '2017',
    '2020',
    '2019',
    '2018',
    '2017',
    '2020',
    '2019',
    '2018',
    '2017',
    '2020',
    '2019',
    '2018',
    '2017',
    '2020',
    '2019',
    '2018',
    '2017',
    '2020',
    '2019',
    '2018',
    '2017',
    '2020',
    '2019',
    '2018',
    '2017',
    '2020',
    '2019',
    '2018',
    '2017',
    '2020',
    '2019',
    '2018',
    '2017',
  ];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   model().listarAlunos().then((value) {
  //     setState(() {
  //       discentes = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the myLoginPage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 21,
                child: ListView.builder(
                  itemBuilder: itemBuilder,
                  itemCount: anos.length,
                )),
          ],
        ));
  }

  Widget itemBuilder(BuildContext context, int index) {
    var relato = [
      ['Anual',
        [ 'PIT 2018',
          'Diário 2018',
          'Plano de Ensino 2018', 'PIT 2018',
          'Diário 2018',
          'Plano de Ensino 2018', 'PIT 2018',
          'Diário 2018',
          'Plano de Ensino 2018', 'PIT 2018',
          'Diário 2018',
          'Plano de Ensino 2018', 'PIT 2018',
          'Diário 2018',
          'Plano de Ensino 2018', 'PIT 2018',
          'Diário 2018',
          'Plano de Ensino 2018',]]
      ,
      ['Semestral',
        ['PIT 2018/1',
          'Plano de Ensino 2018/1',
          'Diário 2018/1','PIT 2018/1',
          'Plano de Ensino 2018/1',
          'Diário 2018/1','PIT 2018/1',
          'Plano de Ensino 2018/1',
          'Diário 2018/1','PIT 2018/1',
          'Plano de Ensino 2018/1',
          'Diário 2018/1','PIT 2018/1',
          'Plano de Ensino 2018/1',
          'Diário 2018/1','PIT 2018/1',
          'Plano de Ensino 2018/1',
          'Diário 2018/1',]]
      ,
      ['2º Semestre',
        ['PIT 2018/2',
          'Plano de Ensino 2018/2',
          'Diário 2018/2',
          'PIT 2018/2',
          'Plano de Ensino 2018/2',
          'Diário 2018/2',
          'PIT 2018/2',
          'Plano de Ensino 2018/2',
          'Diário 2018/2',
          'PIT 2018/2',
          'Plano de Ensino 2018/2',
          'Diário 2018/2',]]
      ,
    ];

    return Container(
        child: Row(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) {
                            return myRelatorio(relato: relato);
                          }));
                },
                child: Text(anos[index],
                    style: const TextStyle(color: Colors.white)),
              ),
              color: Colors.white,
              margin: const EdgeInsets.all(0.2),
            )
        ),
      ],
    ));
  }
}
