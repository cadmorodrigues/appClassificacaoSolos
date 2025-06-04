// imports de dart e ferramentas de MaterialApp e etc
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class telaInicial extends StatefulWidget {
  @override
  _telaInicialState createState() => _telaInicialState();
}

class _telaInicialState extends State<telaInicial> {
  bool claro = true;
  bool portugues = true;

  @override
  Widget build(BuildContext context) {
    // Tamanho da tela
    double alturaTela = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: claro
          ? Color.fromARGB(255, 227, 227, 227)
          : Color.fromARGB(255, 40, 40, 40),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: claro
                  ? AssetImage('figuras/fundoB_quadrado.png')
                  : AssetImage('figuras/fundoP_quadrado.png'),
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(((3 / 100) * alturaTela)),
                child: Column(
                  // Alinhando itens na tela
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: <Widget>[
                    SizedBox(height: (4 / 100) * alturaTela),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: (15 / 100) * alturaTela,
                            width: (15 / 100) * alturaTela,
                            child: Image(
                              image: claro
                                  ? (AssetImage('figuras/logoP.png'))
                                  : (AssetImage('figuras/logoB.png')),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                portugues ? 'Classificação' : 'Soil',
                                style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontSize: (4.3 / 100) * alturaTela,
                                  color: claro
                                      ? Color.fromARGB(255, 40, 40, 40)
                                      : Color.fromARGB(255, 227, 227, 227),
                                ),
                              ),
                              Text(
                                portugues ? 'dos Solos' : 'Classification',
                                style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontSize: (4.3 / 100) * alturaTela,
                                  color: Color.fromARGB(255, 25, 149, 89),
                                ),
                              ),
                              Text(
                                portugues
                                    ? 'Métodos TRB e USC'
                                    : 'TRB and USC Systems',
                                style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontSize: (1.8 / 100) * alturaTela,
                                  color: claro
                                      ? Color.fromARGB(255, 40, 40, 40)
                                      : Color.fromARGB(255, 227, 227, 227),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: (10 / 100) * alturaTela),
                    Text(
                      portugues ? 'Classificar' : 'Classificate',
                      style: TextStyle(
                        color: claro
                            ? Color.fromARGB(255, 40, 40, 40)
                            : Color.fromARGB(255, 227, 227, 227),
                        fontSize: (3 / 100) * alturaTela,
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(claro
                            ? Color.fromARGB(255, 227, 227, 227)
                            : Color.fromARGB(255, 40, 40, 40)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/trb',
                            arguments: {'luz': claro, 'lingua': portugues});
                      },
                      icon: Icon(
                        Icons.add_road_rounded,
                        color: Color.fromARGB(255, 25, 149, 89),
                        size: (4.5 / 100) * alturaTela,
                      ),
                      label: Text(
                        'TRB / AASHTO',
                        style: TextStyle(
                          color: Color.fromARGB(255, 25, 149, 89),
                          fontSize: (3.4 / 100) * alturaTela,
                          fontFamily: 'Comfortaa',
                        ),
                      ),
                    ),
                    SizedBox(height: (2 / 100) * alturaTela),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(claro
                            ? Color.fromARGB(255, 227, 227, 227)
                            : Color.fromARGB(255, 40, 40, 40)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/usc',
                            arguments: {'luz': claro, 'lingua': portugues});
                      },
                      icon: Icon(
                        Icons.edit_road_outlined,
                        color: Color.fromARGB(255, 25, 149, 89),
                        size: (4.5 / 100) * alturaTela,
                      ),
                      label: Text(
                        'USC',
                        style: TextStyle(
                          color: Color.fromARGB(255, 25, 149, 89),
                          fontSize: (3.4 / 100) * alturaTela,
                          fontFamily: 'Comfortaa',
                        ),
                      ),
                    ),
                    SizedBox(height: (7 / 100) * alturaTela),
                    Text(
                      portugues ? 'Descrever' : 'Describe',
                      style: TextStyle(
                        color: claro
                            ? Color.fromARGB(255, 40, 40, 40)
                            : Color.fromARGB(255, 227, 227, 227),
                        fontSize: (3 / 100) * alturaTela,
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(claro
                            ? Color.fromARGB(255, 227, 227, 227)
                            : Color.fromARGB(255, 40, 40, 40)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/info',
                            arguments: {'luz': claro, 'lingua': portugues});
                      },
                      icon: Icon(
                        Icons.info_outline_rounded,
                        color: Color.fromARGB(255, 25, 149, 89),
                        size: (4.5 / 100) * alturaTela,
                      ),
                      label: Text(
                        portugues ? 'Solos' : 'Soils',
                        style: TextStyle(
                          color: Color.fromARGB(255, 25, 149, 89),
                          fontSize: (3.4 / 100) * alturaTela,
                          fontFamily: 'Comfortaa',
                        ),
                      ),
                    ),
                    SizedBox(height: (8 / 100) * alturaTela),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              claro = !claro;
                            });
                          },
                          child: Icon(
                            Icons.lightbulb,
                            color: claro
                                ? Color.fromARGB(255, 227, 227, 227)
                                : Color.fromARGB(255, 40, 40, 40),
                          ),
                          color: claro
                              ? Color.fromARGB(255, 40, 40, 40)
                              : Color.fromARGB(255, 227, 227, 227),
                          height: (7 / 100) * alturaTela,
                          minWidth: (7 / 100) * alturaTela,
                          shape: CircleBorder(),
                          elevation: 0,
                        ),

                        //SizedBox(width: (1 / 100) * alturaTela),

                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              portugues = !portugues;
                            });
                          },
                          child: Container(
                            height: (7 / 100) * alturaTela,
                            width: (7 / 100) * alturaTela,
                            child: Image(
                              image: portugues
                                  ? AssetImage('figuras/bandeiraUK.png')
                                  : AssetImage('figuras/bandeiraBR.png'),
                            ),
                          ),
                          height: (7 / 100) * alturaTela,
                          minWidth: (7 / 100) * alturaTela,
                          shape: CircleBorder(),
                          elevation: 3,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
