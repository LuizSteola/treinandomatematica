import 'package:flutter/material.dart';
import 'package:treinomatematica/telas/Adicao.dart';
import 'package:treinomatematica/telas/Divisao.dart';
import 'package:treinomatematica/telas/Multiplicacao.dart';
import 'package:treinomatematica/telas/Subtracao.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> _telas = [
      Adicao(),
      Subtracao(),
      Multiplicacao(),
      Divisao()
    ];

    return Scaffold(
       body: Center(
         child:_telas[_indiceAtual] ,
       ) ,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
          currentIndex: _indiceAtual,
          onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
          },
          items:[
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: "Adição",
                backgroundColor: Color(0xff097BE6)),
            BottomNavigationBarItem(
                icon: Icon(Icons.remove_circle_outline_outlined),
                label: "Subtração",
                backgroundColor: Color(0xff0D54C7)),
            BottomNavigationBarItem(
                icon: Icon(Icons.highlight_remove_outlined),
                label: "Multiplicação",
                backgroundColor: Color(0xff102EA9)),
            BottomNavigationBarItem(
                icon: Icon(Icons.pending_outlined),
                label: "Divisão",
                backgroundColor: Color(0xff14078A)),
          ]),
    );
  }
}
