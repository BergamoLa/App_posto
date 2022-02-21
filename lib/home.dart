import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _resultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAcool.text);
    double? precoGas = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGas == null) {
     setState(() {
       _resultado = "Numero invalido, digite valores maiores que 0 e utilize (.)";
     });

    } else {
      if((precoAlcool/precoGas) >= 0.7){
        setState(() {
          _resultado = "Melhor abastecer com gasolina";
        });
        limparCampos();
      }else{
        setState(() {
          _resultado = "Melhor abastecer com álcool";
        });
      }
      limparCampos();

    }
  }

  void limparCampos(){
    _controllerGasolina.text ="";
    _controllerAcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool e Gasolina"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("image/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual é a melhor opção de abastecimento do seu carro",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Alcool, ex: 1.59",
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerAcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Gasolina, ex: 7.59",
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    padding: EdgeInsets.all(15),
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                  onPressed: () {
                    _calcular();
                  },
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _resultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
