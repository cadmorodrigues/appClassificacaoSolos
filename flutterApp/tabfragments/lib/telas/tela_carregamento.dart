// INFO: Tela inicial apresentada ao abrir o aplciativo

// imports de dart e ferramentas de MaterialApp e etc
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// ferramenta para tela de loading
import 'package:flutter_spinkit/flutter_spinkit.dart';

class telaCarregamento extends StatefulWidget {
  @override
  _telaCarregamentoState createState() => _telaCarregamentoState();
}

class _telaCarregamentoState extends State<telaCarregamento> {
  // função para passar 5s e ir pra tela inicial
  void passaTempo() async {
    await Future.delayed(Duration(seconds: 3), () {
      // enviando para tela inicial as preferências lidas/criadas
      Navigator.pushReplacementNamed(context, '/inicio');
    });
  }

  @override
  void initState() {
    super.initState();

    // tempo de animação da tela inicial
    passaTempo();
  }

  @override
  Widget build(BuildContext context) {
    // Tamanho da tela
    double alturaTela = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 227, 227),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('figuras/fundoB_quadrado.png'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all((3 / 100) * alturaTela),
          child: Column(
            // Alinhando itens na tela
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,

            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: (32 / 100) * alturaTela,
                    height: (32 / 100) * alturaTela,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('figuras/logoP.png'),
                      ),
                    ),
                  ),
                ],
              ),

              // símbolo de loading
              SpinKitThreeBounce(
                color: Color.fromARGB(255, 25, 149, 89),
                size: (8 / 100) * alturaTela,
              ),

              SizedBox(height: (10 / 100) * alturaTela),
              Text(
                'Classificação',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: (5.8 / 100) * alturaTela,
                  color: Color.fromARGB(255, 40, 40, 40),
                ),
              ),
              Text(
                'dos Solos',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: (5.8 / 100) * alturaTela,
                  color: Color.fromARGB(255, 25, 149, 89),
                ),
              ),
              Text(
                'Métodos TRB e USC',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: (2.3 / 100) * alturaTela,
                  color: Color.fromARGB(255, 40, 40, 40),
                ),
              ),

              SizedBox(height: (10 / 100) * alturaTela),

            ],
          ),
        ),
      ),
    );
  }
}
