import 'package:flutter/material.dart';
import 'dart:math';

class Subtracao extends StatefulWidget {
  const Subtracao({Key? key}) : super(key: key);

  @override
  _SubtracaoState createState() => _SubtracaoState();
}

class _SubtracaoState extends State<Subtracao> {


  double _valorSlider = 10.0;
  String _valorLabel = "10";
  TextEditingController _resposta = new TextEditingController();
  final _random1 = new Random();
  String mensagemResposta = "";
  dynamic num1 = 20;
  dynamic num2 = 10;

  void _criarEquacao() {
    setState(() {
      _resposta.text = "";
      mensagemResposta = "";
      num1 = _random1.nextInt((_valorSlider.toInt()+1));
      num2 = _random1.nextInt((_valorSlider.toInt()+1));
      //verificação para permitir somente resultados positivos
      while(num2 > num1){
        num2 = _random1.nextInt((_valorSlider.toInt()+1));
      }
    });
  }

  void _verificarResultado() {
    int subtracao;
    subtracao = this.num1 - this.num2;
    setState(() {
      FocusScope.of(context).unfocus();
      if (int.parse(_resposta.text) == subtracao) {
        mensagemResposta = "Correto";
      } else {
        mensagemResposta = "Nops! Resposta $subtracao";
      }
    });
    print("Calculado");
  }

  @override
  void initState(){
    super.initState();
    _criarEquacao();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff0B3866), Color(0xffC11E38)])),
                child: Container(
                  width: 600,
                  margin: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient:
                    LinearGradient(colors: [Colors.white, Colors.white70]),
                  ),
                  child:  Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Subtração",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                        Text("Valor máximo no cálculo: ${_valorLabel}",
                            style: TextStyle(fontSize: 15, )),
                        Slider(
                          value: _valorSlider,
                          max: 100,
                          min: 1,
                          divisions: 99,
                          label: _valorLabel,
                          thumbColor: Color(0xff0B3866),
                          activeColor: Color(0xff236AB1),
                          inactiveColor: Color(0xff72B2F2),
                          onChanged: (double valor){
                            setState(() {
                              _valorSlider = double.parse(valor.toStringAsFixed(0));
                              _valorLabel = _valorSlider.toStringAsFixed(0);
                            });
                          },
                          onChangeEnd: (double valor){
                            setState(() {
                              _criarEquacao();
                            });
                          },),
                        Divider(
                          color: Colors.transparent,
                          height: 10,
                        ),
                        Text("Calcule a subtração abaixo",
                            style: TextStyle(fontSize: 15, )),
                        Text("$num1",
                            style: TextStyle(fontSize: 18, )),
                        Text("$num2",
                            style: TextStyle(fontSize: 18, )),
                        Container(
                          color: Colors.black,
                          width: 150,
                          height: 3,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color:  Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          alignment: Alignment.center,
                          width: 130.0,
                          child: TextFormField(
                            cursorColor: Color(0xff0B3866),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            controller: _resposta,
                            style: TextStyle(fontSize: 25.0),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Insira o valor";
                              }
                            },),
                        ),
                        Divider(
                          color: Colors.transparent,
                          height: 15.0,
                        ),
                        ElevatedButton(
                          onPressed: _verificarResultado,

                          child: Text("Responder"),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff0B3866),
                          ),
                        ),
                        Divider(
                          color: Colors.transparent,
                          height: 5.0,
                        ),
                        ElevatedButton(
                            onPressed: (){
                              _criarEquacao();
                              _resposta.clear();
                            },
                            child: Icon(Icons.refresh_rounded),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff0B3866))),
                        Divider(
                            color: Colors.transparent,
                            height: 10.0),
                        Text(
                          mensagemResposta,
                          style: TextStyle(fontSize: 20.0),
                        )





                      ]
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
