/*

--> Versão 05, app Solos <--

Author: Cádmo A. R. Dias
e: diasCadmo@gmail.com

chave: com.pucminas.solos

23/04/2021


 */


// importando material de dart
import 'package:flutter/material.dart';

// importando package para uso de MateralApp e afins
import 'package:flutter/cupertino.dart';

// importando arquivos das telas
import 'package:tabfragments/telas/tela_inicial.dart';
import 'package:tabfragments/telas/tela_usc.dart';
import 'package:tabfragments/telas/tela_trb.dart';
import 'package:tabfragments/telas/tela_info.dart';
import 'package:tabfragments/telas/tela_carregamento.dart';


// programa principal
void main() {

  // tela cheia
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);


  runApp(MaterialApp(

    routes: {
      '/': (context) => telaCarregamento(),
      '/inicio': (context) => telaInicial(),
      '/trb': (context) => telaTRB(),
      '/usc': (context) => telaUSC(),
      '/info': (context) => telaINFO(),
    },

  ));
}
