package com.tabian.tabfragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import static android.text.TextUtils.isEmpty;

public class Tab1Fragment extends Fragment {
    private static final String TAG = "Tab1Fragment";

    private Button btnTEST;
    private EditText trb_LL, trb_LP, trb_P200, trb_P40, trb_P10;
    private double aux_trb_LL, aux_trb_LP, aux_trb_P200, aux_trb_P40, aux_trb_P10, aux_trb_IP;
    private double IG = 0, a, b, c, d, auxIG_IP, auxIG_LL, auxIG_P200;
    private String tipo = "Não encontrada", saida;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.tab1_fragment, container, false);
        btnTEST = (Button) view.findViewById(R.id.btnTEST);
        trb_LL = (EditText) view.findViewById(R.id.trb_LL);
        trb_LP = (EditText) view.findViewById(R.id.trb_LP);
        trb_P200 = (EditText) view.findViewById(R.id.trb_P200);
        trb_P40 = (EditText) view.findViewById(R.id.trb_P40);
        trb_P10 = (EditText) view.findViewById(R.id.trb_P10);

        btnTEST.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (isEmpty(trb_LL.getText()) == false && isEmpty(trb_LP.getText()) == false && isEmpty(trb_P200.getText()) == false && isEmpty(trb_P10.getText()) == false && isEmpty(trb_P40.getText()) == false) {
                    aux_trb_LL = Double.parseDouble(trb_LL.getText().toString());
                    aux_trb_LP = Double.parseDouble(trb_LP.getText().toString());
                    aux_trb_P200 = Double.parseDouble(trb_P200.getText().toString());
                    aux_trb_P40 = Double.parseDouble(trb_P40.getText().toString());
                    aux_trb_P10 = Double.parseDouble(trb_P10.getText().toString());

                    aux_trb_IP = aux_trb_LL - aux_trb_LP;

                    // Testes dos tipos
                    if (aux_trb_LL > 40 && aux_trb_IP > 10 && aux_trb_IP > (aux_trb_LL - 30)) {
                        tipo = "A.7-6";
                    }

                    if (aux_trb_LL > 40 && aux_trb_IP > 10 && aux_trb_IP <= (aux_trb_LL - 30)) {
                        tipo = "A.7-5";
                    }

                    if (aux_trb_P200 > 35 && aux_trb_LL <= 40 && aux_trb_IP > 10) {
                        tipo = "A.6";
                    }

                    if (aux_trb_P200 > 35 && aux_trb_LL > 40 && aux_trb_IP <= 10) {
                        tipo = "A.5";
                    }

                    if (aux_trb_P200 > 35 && aux_trb_LL <= 40 && aux_trb_IP <= 10) {
                        tipo = "A.4";
                    }

                    if (aux_trb_P200 <= 35 && aux_trb_LL > 40 && aux_trb_IP > 10) {
                        tipo = "A.2-7";
                    }

                    if (aux_trb_P200 <= 35 && aux_trb_LL <= 40 && aux_trb_IP > 10) {
                        tipo = "A.2-6";
                    }

                    if (aux_trb_P200 <= 35 && aux_trb_LL > 40 && aux_trb_IP <= 10) {
                        tipo = "A.2-5";
                    }

                    if (aux_trb_P200 <= 35 && aux_trb_LL <= 40 && aux_trb_IP <= 10) {
                        tipo = "A.2-4";
                    }

                    if (aux_trb_P40 > 50 && aux_trb_P200 <= 10 && aux_trb_LL == 0 && aux_trb_IP <= 0) {
                        tipo = "A.3";
                    }

                    if (aux_trb_P40 <= 50 && aux_trb_P200 <= 25 && aux_trb_IP <= 6) {
                        tipo = "A.1-b";
                    }

                    if (aux_trb_P10 <= 50 && aux_trb_P40 <= 30 && aux_trb_P200 <= 15 && aux_trb_IP <= 6) {
                        tipo = "A.1-a";
                    }


                    // Cálculo de IG
                    auxIG_P200 = aux_trb_P200;
                    auxIG_LL = aux_trb_LL;
                    auxIG_IP = aux_trb_IP;

                    if (aux_trb_P200 > 75) {
                        auxIG_P200 = 75;
                    }
                    if (aux_trb_P200 < 35) {
                        auxIG_P200 = 35;
                    }
                    a = auxIG_P200 - 35;

                    if (aux_trb_P200 > 55) {
                        auxIG_P200 = 55;
                    }
                    if (aux_trb_P200 < 15) {
                        auxIG_P200 = 15;
                    }
                    b = auxIG_P200 - 15;

                    if (aux_trb_LL > 60) {
                        auxIG_LL = 60;
                    }
                    if (aux_trb_LL < 40) {
                        auxIG_LL = 40;
                    }
                    c = auxIG_LL - 40;

                    if (aux_trb_IP > 30) {
                        auxIG_IP = 30;
                    }
                    if (aux_trb_IP < 10) {
                        auxIG_IP = 10;
                    }
                    d = auxIG_IP - 10;

                    IG = (int) Math.round(.2 * a + .005 * a * c + .01 * b * d);

                    // Montando texto de saída
                    saida = ("Classificação de solo: " + tipo + " (" + IG + ")");

                    Toast.makeText(getActivity(), saida, Toast.LENGTH_LONG).show();
                }
                else
                {
                    // Montando texto de saída
                    saida = ("Alguns parâmetros de entrada não foram preenchidos. Favor verificar a entrada de dados");
                    Toast.makeText(getActivity(), saida, Toast.LENGTH_SHORT).show();
                }
            }
        });

        return view;
    }
}

/**
 * Created by Cádmo Dias on 05/12/2018.
 * e-mail: cadmordias@gmail.com
 */