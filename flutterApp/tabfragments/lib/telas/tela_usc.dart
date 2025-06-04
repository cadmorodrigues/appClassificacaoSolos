// imports de dart e ferramentas de MaterialApp e etc
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class telaUSC extends StatefulWidget {
  @override
  _telaUSCState createState() => _telaUSCState();
}

class _telaUSCState extends State<telaUSC> {
  // variáveis vindas da função da tela inicial
  Map configuracoes = {};

  // variáveis das caixas
  TextEditingController p200 = TextEditingController();
  TextEditingController p4 = TextEditingController();
  TextEditingController LL = TextEditingController();
  TextEditingController IP = TextEditingController();
  TextEditingController phi10 = TextEditingController();
  TextEditingController phi30 = TextEditingController();
  TextEditingController phi60 = TextEditingController();

  // Resultado
  String resultado = '';

  // Função de classificação USC
  String classificaUSC(p200, p4, ll, ip, phi10, phi30, phi60, ptIG) {
    // verificando se algum dos valores está empty
    if (p200.isEmpty ||
        p4.isEmpty ||
        ll.isEmpty ||
        ip.isEmpty ||
        phi10.isEmpty ||
        phi30.isEmpty ||
        phi60.isEmpty) {
      ptIG
          ? (resultado = 'Favor preencher todos os parâmetros acima')
          : (resultado = 'Please make sure all fields are filled');
    } else {
      // substituindo vírgula por ponto
      if (p200.contains(",")) {
        p200 = p200.replaceFirst(RegExp(','), '.');
      }
      if (p4.contains(",")) {
        p4 = p4.replaceFirst(RegExp(','), '.');
      }
      if (ll.contains(",")) {
        ll = ll.replaceFirst(RegExp(','), '.');
      }
      if (ip.contains(",")) {
        ip = ip.replaceFirst(RegExp(','), '.');
      }
      if (phi10.contains(",")) {
        phi10 = phi10.replaceFirst(RegExp(','), '.');
      }
      if (phi30.contains(",")) {
        phi30 = phi30.replaceFirst(RegExp(','), '.');
      }
      if (phi60.contains(",")) {
        phi60 = phi60.replaceFirst(RegExp(','), '.');
      }

      // passando valores para double
      double P200 = double.parse(p200);
      double P4 = double.parse(p4);
      double LL = double.parse(ll);
      double IP = double.parse(ip);
      double fi10 = double.parse(phi10);
      double fi30 = double.parse(phi30);
      double fi60 = double.parse(phi60);

      // variáveis locais
      double Cc, Cu;

      // cálculo de cc e cu
      Cc = (pow(fi30, 2)) / (fi60 * fi10);
      Cu = fi60 / fi10;

      // GW-GP-SW-SP
      if (P200 <= 5) {
        // G
        if ((100 - P4) > (P4 - P200)) {
          // W
          if (Cc >= 1 && Cc <= 3 && Cu > 4) {
            resultado = 'GW';
          }
          // P
          else {
            resultado = 'GP';
          }
        }
        // S
        else if ((100 - P4) < (P4 - P200)) {
          // W
          if (Cc >= 1 && Cc <= 3 && Cu > 6) {
            resultado = 'SW';
          }
          // P
          else {
            resultado = 'SP';
          }
        }
      }
      // GW – GC | GW – GM | GP – GC | GP – GM | SW – SC | SW – SM | SP – SC | SP – SM
      else if (P200 > 5 && P200 <= 12) {
        // G
        if ((100 - P4) > (P4 - P200)) {
          // W
          if (Cc >= 1 && Cc <= 3 && Cu > 4) {
            // C
            if (IP > 7 && IP > 0.73 * (LL - 20)) {
              resultado = 'GW-GC';
            }
            // M
            else if (IP <= 0.73 * (LL - 20) || IP <= 7) {
              resultado = 'GW-GM';
            }
          }
        }
        // P
        else {
          // C
          if (IP > 7 && IP > 0.73 * (LL - 20)) {
            resultado = 'GP-GC';
          }
          // M
          else if (IP <= 0.73 * (LL - 20) || IP <= 7) {
            resultado = 'GP-GM';
          }
        }
      } // S
      else if ((100 - P4) < (P4 - P200)) {
        // W
        if (Cc >= 1 && Cc <= 3 && Cu > 6) {
          // C
          if (IP > 7 && IP > 0.73 * (LL - 20)) {
            resultado = 'SW-SC';
          }
          // M
          else if (IP <= 0.73 * (LL - 20) || IP <= 7) {
            resultado = 'SW-SM';
          }
        }
        // P
        else {
          // C
          if (IP > 7 && IP > 0.73 * (LL - 20)) {
            resultado = 'SP-SC';
          }
          //M
          else if (IP <= 0.73 * (LL - 20) || IP <= 7) {
            resultado = 'SP-SM';
          }
        }
      }

      // GC | GM | SC | SM
      else if (P200 > 12 && P200 <= 50) {
        // G
        if ((100 - P4) > (P4 - P200)) {
          // C
          if (IP > 7 && IP > 0.73 * (LL - 20)) {
            resultado = 'GC';
          }
          // M
          else if (IP <= 0.73 * (LL - 20) || IP <= 7) {
            resultado = 'GM';
          }
        }
        // S
        else if ((100 - P4) < (P4 - P200)) {
          // C
          if (IP > 7 && IP > 0.73 * (LL - 20)) {
            resultado = 'SC';
          }
          // M
          else if (IP <= 0.73 * (LL - 20) || IP <= 7) {
            resultado = 'SM';
          }
        }
      }
      // CH | MH ou OH | CL | ML ou OL | CL-ML
      else if (P200 > 50) {
        // C-M
        if ((IP > 4 && IP <= 7) && IP > (LL - 20)) {
          // H
          if (LL > 50) {
            resultado = 'CH-MH';
          }
          // L
          else if (LL <= 50) {
            resultado = 'CL-ML';
          }
        }
        // C
        else if (IP > 7 && IP > 0.73 * (LL - 20)) {
          // H
          if (LL > 50) {
            resultado = 'CH';
          }
          // L
          else if (LL <= 50) {
            resultado = 'CL';
          }
        }
        // M
        else if (IP <= 0.73 * (LL - 20) || IP <= 4) {
          // H
          if (LL > 50) {
            resultado = 'MH (OH)';
          }
          // L
          else if (LL <= 50) {
            resultado = 'ML (OL)';
          }
        }
      } else {
        ptIG
            ? resultado = 'Classificação não encontrada. O solo pode ser Pt.'
            : resultado = 'Classification not found. Maybe the soil is Pt';
      }
    }
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    // Tamanho da tela
    double alturaTela = MediaQuery.of(context).size.height;

    // variáveis vindas da função da tela inicial
    configuracoes = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        backgroundColor: configuracoes['luz']
            ? Color.fromARGB(255, 227, 227, 227)
            : Color.fromARGB(255, 40, 40, 40),
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: configuracoes['luz']
              ? Color.fromARGB(255, 227, 227, 227)
              : Color.fromARGB(255, 40, 40, 40),
          leading: BackButton(
            color: configuracoes['luz']
                ? Color.fromARGB(255, 40, 40, 40)
                : Color.fromARGB(255, 227, 227, 227),
          ),
          title: Text(
            'USC',
            style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: (3.2 / 100) * alturaTela,
              color: configuracoes['luz']
                  ? Color.fromARGB(255, 40, 40, 40)
                  : Color.fromARGB(255, 227, 227, 227),
            ),
          ),
          centerTitle: true,
          actions: [
            Container(
              alignment: Alignment.bottomCenter,
              height: (10 / 100) * alturaTela,
              width: (10 / 100) * alturaTela,
              child: Image(
                image: configuracoes['luz']
                    ? (AssetImage('figuras/logoP.png'))
                    : (AssetImage('figuras/logoB.png')),
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: configuracoes['luz']
                  ? (AssetImage('figuras/fundoB_quadrado.png'))
                  : (AssetImage('figuras/fundoP_quadrado.png')),
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB((2 / 100) * alturaTela,
                    (2 / 100) * alturaTela, (2 / 100) * alturaTela, 0),
                child: Column(
                  // Alinhando itens na tela
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
                    SizedBox(height: (3.3 / 100) * alturaTela),
                    Text(
                      configuracoes['lingua']
                          ? 'Diâmetros correspondentes [mm]'
                          : 'Diameters [mm]',
                      style: TextStyle(
                        color: configuracoes['luz']
                            ? Color.fromARGB(255, 40, 40, 40)
                            : Color.fromARGB(255, 198, 198, 198),
                        fontSize: (3 / 100) * alturaTela,
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                    SizedBox(height: (1.2 / 100) * alturaTela),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: (7 / 100) * alturaTela),
                        Expanded(
                          child: TextField(
                            onTap: () {
                              resultado = '';
                            },
                            //obscureText: true, <- deixa texto oculto
                            //border: InputBorder.none, <- tira borda
                            controller: p200,
                            textAlign: TextAlign.center,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),

                            // após mudar, colocando phis como 0 já que são desnecessários se P200 > 15
                            onChanged: (p200) {
                              if (p200.isNotEmpty) {
                                if ((double.parse(p200)) >= 12) {
                                  phi10.text = '0';
                                  phi30.text = '0';
                                  phi60.text = '0';
                                }
                              }
                            },

                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: (3.2 / 100) * alturaTela,
                              color: Color.fromARGB(255, 25, 149, 89),
                            ),

                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              hintText: 'P200',
                              hintStyle: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: (3.2 / 100) * alturaTela,
                                color: Color.fromARGB(255, 114, 114, 114),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: (7 / 100) * alturaTela),
                        Expanded(
                          child: TextField(
                            onTap: () {
                              resultado = '';
                            },
                            controller: p4,
                            textAlign: TextAlign.center,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: (3.2 / 100) * alturaTela,
                              color: Color.fromARGB(255, 25, 149, 89),
                            ),
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              hintText: 'P4',
                              hintStyle: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: (3.2 / 100) * alturaTela,
                                color: Color.fromARGB(255, 114, 114, 114),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: (7 / 100) * alturaTela),
                      ],
                    ),
                    SizedBox(height: (5 / 100) * alturaTela),
                    Text(
                      configuracoes['lingua']
                          ? 'Porcentagens que passam [%]'
                          : 'Percent passing [%]',
                      style: TextStyle(
                        color: configuracoes['luz']
                            ? Color.fromARGB(255, 40, 40, 40)
                            : Color.fromARGB(255, 198, 198, 198),
                        fontSize: (3 / 100) * alturaTela,
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                    SizedBox(height: (1.2 / 100) * alturaTela),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            onTap: () {
                              resultado = '';
                            },
                            //obscureText: true, <- deixa texto oculto
                            //border: InputBorder.none, <- tira borda
                            controller: phi10,
                            textAlign: TextAlign.center,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),

                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: (3.2 / 100) * alturaTela,
                              color: Color.fromARGB(255, 25, 149, 89),
                            ),

                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              hintText: 'Φ 10',
                              hintStyle: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: (3.2 / 100) * alturaTela,
                                color: Color.fromARGB(255, 114, 114, 114),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: (3.2 / 100) * alturaTela),
                        Expanded(
                          child: TextField(
                            onTap: () {
                              resultado = '';
                            },
                            //obscureText: true, <- deixa texto oculto
                            //border: InputBorder.none, <- tira borda
                            controller: phi30,
                            textAlign: TextAlign.center,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),

                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: (3.2 / 100) * alturaTela,
                              color: Color.fromARGB(255, 25, 149, 89),
                            ),

                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              hintText: 'Φ 30',
                              hintStyle: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: (3.2 / 100) * alturaTela,
                                color: Color.fromARGB(255, 114, 114, 114),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: (3.2 / 100) * alturaTela),
                        Expanded(
                          child: TextField(
                            onTap: () {
                              resultado = '';
                            },
                            controller: phi60,
                            textAlign: TextAlign.center,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: (3.2 / 100) * alturaTela,
                              color: Color.fromARGB(255, 25, 149, 89),
                            ),
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              hintText: 'Φ 60',
                              hintStyle: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: (3.2 / 100) * alturaTela,
                                color: Color.fromARGB(255, 114, 114, 114),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: (3.2 / 100) * alturaTela),
                      ],
                    ),
                    SizedBox(height: (5 / 100) * alturaTela),
                    Text(
                      configuracoes['lingua']
                          ? 'Limite de plasticidade'
                          : 'Plasticity index',
                      style: TextStyle(
                        color: configuracoes['luz']
                            ? Color.fromARGB(255, 40, 40, 40)
                            : Color.fromARGB(255, 198, 198, 198),
                        fontSize: (3 / 100) * alturaTela,
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                    SizedBox(height: (1.2 / 100) * alturaTela),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: (7 / 100) * alturaTela),
                        Expanded(
                          child: TextField(
                            onTap: () {
                              resultado = '';
                            },
                            controller: LL,
                            textAlign: TextAlign.center,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: (3.2 / 100) * alturaTela,
                              color: Color.fromARGB(255, 25, 149, 89),
                            ),
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              hintText: 'LL',
                              hintStyle: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: (3.2 / 100) * alturaTela,
                                color: Color.fromARGB(255, 114, 114, 114),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: (7 / 100) * alturaTela),
                        Expanded(
                          child: TextField(
                            onTap: () {
                              resultado = '';
                            },
                            controller: IP,
                            textAlign: TextAlign.center,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: (3.2 / 100) * alturaTela,
                              color: Color.fromARGB(255, 25, 149, 89),
                            ),
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              hintText: 'IP',
                              hintStyle: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: (3.2 / 100) * alturaTela,
                                color: Color.fromARGB(255, 114, 114, 114),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: (7 / 100) * alturaTela),
                      ],
                    ),
                    SizedBox(height: (5 / 100) * alturaTela),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  configuracoes['luz']
                                      ? Color.fromARGB(255, 227, 227, 227)
                                      : Color.fromARGB(255, 40, 40, 40)),
                            ),
                            onPressed: () {
                              setState(() {
                                // chamando função que analisa o solo
                                resultado = classificaUSC(
                                  p200.text.toString(),
                                  p4.text.toString(),
                                  LL.text.toString(),
                                  IP.text.toString(),
                                  phi10.text.toString(),
                                  phi30.text.toString(),
                                  phi60.text.toString(),
                                  configuracoes['lingua'],
                                );
                              });
                            },
                            icon: Icon(
                              Icons.architecture_rounded,
                              color: Color.fromARGB(255, 25, 149, 89),
                              size: (3.5 / 100) * alturaTela,
                            ),
                            label: Text(
                              configuracoes['lingua']
                                  ? 'Classificar'
                                  : 'Classificate',
                              style: TextStyle(
                                color: Color.fromARGB(255, 114, 114, 114),
                                fontSize: (3 / 100) * alturaTela,
                                fontFamily: 'Comfortaa',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: (1 / 100) * alturaTela),
                        Center(
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  configuracoes['luz']
                                      ? Color.fromARGB(255, 227, 227, 227)
                                      : Color.fromARGB(255, 40, 40, 40)),
                            ),
                            onPressed: () {
                              setState(() {
                                p200.text = '';
                                p4.text = '';
                                LL.text = '';
                                IP.text = '';
                                phi10.text = '';
                                phi30.text = '';
                                phi60.text = '';
                                resultado = '';
                              });
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Color.fromARGB(255, 25, 149, 89),
                              size: (3.5 / 100) * alturaTela,
                            ),
                            label: Text(
                              '',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: (1 / 100) * alturaTela),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          (4.5 / 100) * alturaTela,
                          (4.5 / 100) * alturaTela,
                          (4.5 / 100) * alturaTela,
                          0),
                      child: Center(
                        child: Text(
                          '${resultado}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 25, 149, 89),
                            fontSize: (4 / 100) * alturaTela,
                            fontFamily: 'Comfortaa',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
