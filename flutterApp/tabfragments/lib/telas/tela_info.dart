// imports de dart e ferramentas de MaterialApp e etc
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Classe dos solos
class classeDescricaoSolos {
  String tipoSolo, descricaoSolo;

  // construtor
  classeDescricaoSolos({this.tipoSolo, this.descricaoSolo});
}

class telaINFO extends StatefulWidget {
  @override
  _telaINFOState createState() => _telaINFOState();
}

class _telaINFOState extends State<telaINFO> {
  // variável que armazena se é usc ou trb
  bool trbUsc = true;

  // Descrição dos solos
  // TRB
  List<classeDescricaoSolos> descricaoSolosTRB = [
    classeDescricaoSolos(
        tipoSolo: 'A.1',
        descricaoSolo: 'Fragmentos de pedra, pedregulho fino e areia'),
    classeDescricaoSolos(
        tipoSolo: 'A.2', descricaoSolo: 'Lodoso ou cascalho e areia argilosa'),
    classeDescricaoSolos(tipoSolo: 'A.3', descricaoSolo: 'Areia fina'),
    classeDescricaoSolos(tipoSolo: 'A.4', descricaoSolo: 'Solos siltosos'),
    classeDescricaoSolos(tipoSolo: 'A.5', descricaoSolo: 'Solos siltosos'),
    classeDescricaoSolos(tipoSolo: 'A.6', descricaoSolo: 'Solos argilosos'),
    classeDescricaoSolos(tipoSolo: 'A.7', descricaoSolo: 'Solos argilosos'),
    classeDescricaoSolos(
        tipoSolo: 'A.8',
        descricaoSolo:
            'Cor e odor típicos, partículas fibrosas, fofo, altamente compressível, muito leve e inflamável quando seco, não-plásticos'),
  ];

  // USC
  List<classeDescricaoSolos> descricaoSolosUSC = [
    classeDescricaoSolos(
        tipoSolo: 'GW', descricaoSolo: 'Pedregulho bem graduado'),
    classeDescricaoSolos(
        tipoSolo: 'GP', descricaoSolo: 'Pedregulho mal graduado'),
    classeDescricaoSolos(tipoSolo: 'GM', descricaoSolo: 'Pedregulho silte'),
    classeDescricaoSolos(tipoSolo: 'GC', descricaoSolo: 'Pedregulho argila'),
    classeDescricaoSolos(tipoSolo: 'SW', descricaoSolo: 'Areia bem graduada'),
    classeDescricaoSolos(tipoSolo: 'SP', descricaoSolo: 'Areia mal graduada'),
    classeDescricaoSolos(tipoSolo: 'SM', descricaoSolo: 'Areia silte'),
    classeDescricaoSolos(tipoSolo: 'SC', descricaoSolo: 'Areia argila'),
    classeDescricaoSolos(
        tipoSolo: 'CL', descricaoSolo: 'Argila baixa compressibilidade	'),
    classeDescricaoSolos(
        tipoSolo: 'ML', descricaoSolo: 'Silte baixa compressibilidade'),
    classeDescricaoSolos(
        tipoSolo: 'OL', descricaoSolo: 'Orgânico baixa compressibilidade'),
    classeDescricaoSolos(
        tipoSolo: 'CH', descricaoSolo: 'Argila alta compressibilidade'),
    classeDescricaoSolos(
        tipoSolo: 'MH', descricaoSolo: 'Silte alta compressibilidade'),
    classeDescricaoSolos(
        tipoSolo: 'OH', descricaoSolo: 'Orgânico alta compressibilidade'),
    classeDescricaoSolos(tipoSolo: 'Pt', descricaoSolo: 'Turfa'),
  ];

  // TRB
  List<classeDescricaoSolos> descricaoSolosTRB_ig = [
    classeDescricaoSolos(
        tipoSolo: 'A.1', descricaoSolo: 'Stone fragments, gravel and sand'),
    classeDescricaoSolos(
        tipoSolo: 'A.2', descricaoSolo: 'Silty or clayey gravel and sand'),
    classeDescricaoSolos(tipoSolo: 'A.3', descricaoSolo: 'Fine sand'),
    classeDescricaoSolos(tipoSolo: 'A.4', descricaoSolo: 'Silty soils'),
    classeDescricaoSolos(tipoSolo: 'A.5', descricaoSolo: 'Silty soils'),
    classeDescricaoSolos(tipoSolo: 'A.6', descricaoSolo: 'Clayey soils'),
    classeDescricaoSolos(tipoSolo: 'A.7', descricaoSolo: 'Clayey soils'),
    classeDescricaoSolos(
        tipoSolo: 'A.8', descricaoSolo: 'Highly organic soils: Peat or muck'),
  ];

  // USC
  List<classeDescricaoSolos> descricaoSolosUSC_ig = [
    classeDescricaoSolos(tipoSolo: 'GW', descricaoSolo: 'Well-graded gravel'),
    classeDescricaoSolos(tipoSolo: 'GP', descricaoSolo: 'Poorly graded gravel'),
    classeDescricaoSolos(tipoSolo: 'GM', descricaoSolo: 'Silty gravel'),
    classeDescricaoSolos(tipoSolo: 'GC', descricaoSolo: 'Clayey gravel'),
    classeDescricaoSolos(tipoSolo: 'SW', descricaoSolo: 'Well-graded sand'),
    classeDescricaoSolos(tipoSolo: 'SP', descricaoSolo: 'Poorly graded sand'),
    classeDescricaoSolos(tipoSolo: 'SM', descricaoSolo: 'Silty sand'),
    classeDescricaoSolos(tipoSolo: 'SC', descricaoSolo: 'Clayey sand'),
    classeDescricaoSolos(tipoSolo: 'CL', descricaoSolo: 'Lean clay'),
    classeDescricaoSolos(tipoSolo: 'ML', descricaoSolo: 'Silt'),
    classeDescricaoSolos(
        tipoSolo: 'OL', descricaoSolo: 'Organic clay / Organic silt'),
    classeDescricaoSolos(tipoSolo: 'CH', descricaoSolo: 'Fat clay'),
    classeDescricaoSolos(tipoSolo: 'MH', descricaoSolo: 'Elastic silt'),
    classeDescricaoSolos(
        tipoSolo: 'OH', descricaoSolo: 'Organic clay / Organic silt'),
    classeDescricaoSolos(tipoSolo: 'Pt', descricaoSolo: 'Peat'),
  ];

  @override
  Widget build(BuildContext context) {
    // Tamanho da tela
    double larguraTela = MediaQuery.of(context).size.width;
    double alturaTela = MediaQuery.of(context).size.height;

    // variáveis vindas da função da tela inicial
    Map configuracoes = ModalRoute.of(context).settings.arguments;

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
          configuracoes['lingua'] ? 'Solos' : 'Soils',
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
      body: SafeArea(
        child: Container(
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
                padding: EdgeInsets.all(((2 / 100) * alturaTela)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: (.5 / 100) * alturaTela),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            configuracoes['luz']
                                ? Color.fromARGB(255, 227, 227, 227)
                                : Color.fromARGB(255, 40, 40, 40)),
                      ),
                      onPressed: () {
                        setState(() {
                          //trbUsc ? (trbUsc = false) : (trbUsc = true);
                          trbUsc = !trbUsc;
                        });
                      },
                      icon: Icon(
                        Icons.autorenew_rounded,
                        color: Color.fromARGB(255, 25, 149, 89),
                        size: (0 / 100) * alturaTela,
                      ),
                      label: Container(
                        child: Row(
                          children: [
                            Text(
                              trbUsc ? 'TRB  ' : 'USC  ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 25, 149, 89),
                                fontSize: (3.4 / 100) * alturaTela,
                                fontFamily: 'Comfortaa',
                              ),
                            ),
                            Icon(
                              Icons.compare_arrows_rounded,
                              color: Color.fromARGB(255, 114, 114, 114),
                              size: (4 / 100) * alturaTela,
                            ),
                            Text(
                              trbUsc ? '  USC' : '  TRB',
                              style: TextStyle(
                                color: Color.fromARGB(255, 114, 114, 114),
                                fontSize: (3.4 / 100) * alturaTela,
                                fontFamily: 'Comfortaa',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: (1 / 100) * alturaTela),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: trbUsc
                          ? descricaoSolosTRB.length
                          : descricaoSolosUSC.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {},
                          title: Text(
                            trbUsc
                                ? (configuracoes['lingua']
                                ? descricaoSolosTRB[index].tipoSolo
                                : descricaoSolosTRB_ig[index].tipoSolo)
                                : (configuracoes['lingua']
                                ? descricaoSolosUSC[index].tipoSolo
                                : descricaoSolosUSC_ig[index]
                                .tipoSolo),
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: (3.4 / 100) * alturaTela,
                              color: Color.fromARGB(255, 25, 149, 89),
                            ),
                          ),
                          subtitle: Text(
                            trbUsc
                                ? (configuracoes['lingua']
                                    ? descricaoSolosTRB[index].descricaoSolo
                                    : descricaoSolosTRB_ig[index].descricaoSolo)
                                : (configuracoes['lingua']
                                    ? descricaoSolosUSC[index].descricaoSolo
                                    : descricaoSolosUSC_ig[index]
                                        .descricaoSolo),
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: (2.7 / 100) * alturaTela,
                              color: configuracoes['luz']
                                  ? Color.fromARGB(255, 40, 40, 40)
                                  : Color.fromARGB(255, 227, 227, 227),
                            ),
                          ),
                        );
                      },
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
