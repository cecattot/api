import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

  runApp(myRelatorio(relato: relato));
}

class myRelatorio extends StatelessWidget {
  myRelatorio({Key? key, required this.relato}) : super(key: key);
  var relato;

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
      home: myRelatorioPage(title: "", documentos: relato),
    );
  }
}

class myRelatorioPage extends StatefulWidget {
  myRelatorioPage({Key? key, required this.title, required this.documentos})
      : super(key: key);
  var documentos;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<myRelatorioPage> createState() =>
      _myRelatorioPageState(relato: documentos);
}

class _myRelatorioPageState extends State<myRelatorioPage> {
  _myRelatorioPageState({required this.relato});

  var relato;

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
                  itemCount: relato.length,
                )),
          ],
        ));

  }

  Widget itemBuilder(BuildContext context, int index) {
    List<String> doc = relato[index][1];

    return Column(children: [
      Container(
        child: Center(
          child: Text(relato[index][0],
              style: const TextStyle(color: Colors.white, fontSize: 30)),
        ),
        color: Colors.green,
        margin: const EdgeInsets.all(1),
      ),
      ListView.builder(
        // scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: doc.length,
        itemBuilder: (BuildContext context, int index) {return Container(
            child: Center(
              child: Text(doc[index].toString(), style: const TextStyle(fontSize: 18),)),
              margin: const EdgeInsets.all(1),
          ); },

      )
    ]);
  }
}
