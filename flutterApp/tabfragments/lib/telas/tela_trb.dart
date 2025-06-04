// imports de dart e ferramentas de MaterialApp e etc
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class telaTRB extends StatefulWidget {
  @override
  _telaTRBState createState() => _telaTRBState();
}

class _telaTRBState extends State<telaTRB> {
  // variáveis vindas da função da tela inicial
  Map configuracoes = {};

  // variáveis das caixas
  TextEditingController p200 = TextEditingController();
  TextEditingController p40 = TextEditingController();
  TextEditingController p10 = TextEditingController();
  TextEditingController LL = TextEditingController();
  TextEditingController IP = TextEditingController();

  // Resultado
  String resultado = '';

  // Função de classificação TRB
  String classificaTRB(p200, p40, p10, ll, ip, ptIG) {
    print(ptIG);
    // verificando se algum dos valores está empty
    if (p200.isEmpty ||
        p40.isEmpty ||
        p10.isEmpty ||
        ll.isEmpty ||
        ip.isEmpty) {
      ptIG? (resultado = 'Favor preencher todos os parâmetros acima') : (resultado = 'Please make sure all fields are filled');
    } else {

      // substituindo vírgula por ponto
      if (p200.contains(",")) {
        p200 = p200.replaceFirst(RegExp(','), '.');
      }
      if (p40.contains(",")) {
        p40 = p40.replaceFirst(RegExp(','), '.');
      }
      if (p10.contains(",")) {
        p10 = p10.replaceFirst(RegExp(','), '.');
      }
      if (ll.contains(",")) {
        ll = ll.replaceFirst(RegExp(','), '.');
      }
      if (ip.contains(",")) {
        ip = ip.replaceFirst(RegExp(','), '.');
      }

      // passando valores para double
      double P200 = double.parse(p200);
      double P40 = double.parse(p40);
      double P10 = double.parse(p10);
      double LL = double.parse(ll);
      double IP = double.parse(ip);

      // cálculo de IG
      int IG;
      IG = ((P200 - 35) * (0.2 + 0.005 * (LL - 40)) +
              0.01 * (P200 - 15) * (IP - 10))
          .ceil();
      if (IG < 0) {
        IG = 0;
      }

      // classificando
      // A.1-a
      if (P10 <= 50 && P40 <= 30 && P200 <= 15 && IP <= 6) {
        resultado = 'A.1-a(0)';
      }

      // A.1-b
      else if (P40 <= 50 && P200 <= 25 && IP <= 6) {
        'A.1-b(0)';
      }

      // A.2-4
      else if (P200 <= 35 && LL <= 40 && IP <= 10) {
        resultado = 'A.2-4(0)';
      }

      // A.3
      else if (P200 <= 10 && P40 > 50 && LL == 0 && IP == 0) {
        resultado = 'A.3(0)';
      }

      // A.2-5
      else if (P200 <= 35 && LL > 40 && IP <= 10) {
        resultado = 'A.2-5(0)';
      }
      // A.2-6
      else if (P200 <= 35 && LL <= 40 && IP > 10) {
        resultado = 'A.2-6(' + IG.toString() + ')';
      }

      // A.2-7
      else if (P200 <= 35 && LL > 40 && IP > 10) {
        resultado = 'A.2-7(' + IG.toString() + ')';
      }

      // A.4
      else if (P200 > 35 && LL <= 40 && IP <= 10) {
        resultado = 'A.4(' + IG.toString() + ')';
      }

      // A.5
      else if (P200 > 35 && LL > 40 && IP <= 10) {
        resultado = 'A.5(' + IG.toString() + ')';
      }

      // A.6
      else if (P200 > 35 && LL <= 40 && IP > 10) {
        resultado = 'A.6(' + IG.toString() + ')';
      }

      // A.7-5
      else if (P200 > 35 && LL > 40 && IP > 10 && IP <= (LL - 30)) {
        resultado = 'A.7-5(' + IG.toString() + ')';
      }

      // A.7-6
      else if (P200 > 35 && LL > 40 && IP > 10 && IP > (LL - 30)) {
        resultado =
            'A.7-6(' +
                IG.toString() +
                ')';
      }

      // A-8
      else {
        ptIG ?
        resultado = 'Classificação não encontrada. O solo pode ser A-8.' :
        resultado = 'Classification not found. Maybe the soil is A-8';
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
            'TRB / AASHTO',
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
                      configuracoes['lingua'] ?
                      'Porcentagens que passam [%]':
                      'Percent passing [%]',
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
                            controller: p200,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.numberWithOptions(decimal:  true),

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
                        SizedBox(width: (3.2 / 100) * alturaTela),
                        Expanded(
                          child: TextField(
                            onTap: () {
                              resultado = '';
                            },
                            controller: p40,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.numberWithOptions(decimal:  true),
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: (3.2 / 100) * alturaTela,
                              color: Color.fromARGB(255, 25, 149, 89),
                            ),
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              hintText: 'P40',
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
                            controller: p10,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.numberWithOptions(decimal:  true),
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: (3.2 / 100) * alturaTela,
                              color: Color.fromARGB(255, 25, 149, 89),
                            ),
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              hintText: 'P10',
                              hintStyle: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: (3.2 / 100) * alturaTela,
                                color: Color.fromARGB(255, 114, 114, 114),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: (7 / 100) * alturaTela),
                    Text(
                      configuracoes['lingua'] ?
                      'Limite de plasticidade' :
                      'Plasticity index',
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
                            keyboardType: TextInputType.numberWithOptions(decimal:  true),
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
                            keyboardType: TextInputType.numberWithOptions(decimal:  true),
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
                                    : Color.fromARGB(255, 40, 40, 40)
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                // chamando função que analisa o solo
                                resultado = classificaTRB(
                                    p200.text.toString(),
                                    p40.text.toString(),
                                    p10.text.toString(),
                                    LL.text.toString(),
                                    IP.text.toString(),
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
                              configuracoes['lingua'] ?
                              'Classificar' :
                              'Classificate',
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
                                    : Color.fromARGB(255, 40, 40, 40)
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                p200.text = '';
                                p40.text = '';
                                p10.text = '';
                                LL.text = '';
                                IP.text = '';
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
                    SizedBox(height: (5 / 100) * alturaTela),
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
