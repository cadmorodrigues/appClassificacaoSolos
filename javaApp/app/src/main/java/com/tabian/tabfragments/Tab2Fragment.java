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

public class Tab2Fragment extends Fragment {
    private static final String TAG = "Tab2Fragment";

    private Button btnTEST;
    private EditText usc_LL, usc_LP, usc_P200, usc_P4, usc_FI10, usc_FI30, usc_FI60;
    private double aux_usc_LL, aux_usc_LP, aux_usc_IP, aux_usc_P200, aux_usc_P4, aux_usc_FI10, aux_usc_FI30, aux_usc_FI60;
    private String tipo = "Não encontrada", saida, aux_sai1, aux_sai2, aux_sai3, aux_sai4;
    private double aux_calculo, Cu, Cc, aux_cont1, aux_cont2;
    private double aux_testaW;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.tab2_fragment, container, false);
        btnTEST = (Button) view.findViewById(R.id.btnTEST2);
        usc_LL = (EditText) view.findViewById(R.id.usc_LL);
        usc_LP = (EditText) view.findViewById(R.id.usc_LP);
        usc_P200 = (EditText) view.findViewById(R.id.usc_P200);
        usc_P4 = (EditText) view.findViewById(R.id.usc_P4);
        usc_FI10 = (EditText) view.findViewById(R.id.usc_FI10);
        usc_FI30 = (EditText) view.findViewById(R.id.usc_FI30);
        usc_FI60 = (EditText) view.findViewById(R.id.usc_FI60);


        btnTEST.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (isEmpty(usc_LL.getText()) == false && isEmpty(usc_LP.getText()) == false && isEmpty(usc_P200.getText()) == false && isEmpty(usc_P4.getText()) == false && isEmpty(usc_FI60.getText()) == false && isEmpty(usc_FI30.getText()) == false && isEmpty(usc_FI10.getText()) == false){
                aux_usc_LL = Double.parseDouble(usc_LL.getText().toString());
                aux_usc_LP = Double.parseDouble(usc_LP.getText().toString());
                aux_usc_P200 = Double.parseDouble(usc_P200.getText().toString());
                aux_usc_P4 = Double.parseDouble(usc_P4.getText().toString());
                aux_usc_FI10 = Double.parseDouble(usc_FI10.getText().toString());
                aux_usc_FI30 = Double.parseDouble(usc_FI30.getText().toString());
                aux_usc_FI60 = Double.parseDouble(usc_FI60.getText().toString());
                aux_usc_IP = aux_usc_LL - aux_usc_LP;

                // Classificação

                    // ******* Caixa 1
                    if (aux_usc_P200 <= 5)
                    {
                        // Verifica G ou S
                        aux_cont1 = 100 - aux_usc_P4;
                        aux_cont2 = aux_usc_P4 - aux_usc_P200;
                        if (aux_cont1 > aux_cont2)
                        {
                            aux_sai1  = "G";
                        }
                        if (aux_cont1 < aux_cont2)
                        {
                            aux_sai1  = "S";
                        }

                        // Verifica W ou P
                        aux_sai2  = "P";
                        Cu = aux_usc_FI60 / aux_usc_FI10;
                        Cc = (aux_usc_FI30 * aux_usc_FI30) / (aux_usc_FI60 * aux_usc_FI10);
                        if(Cc >= 1 && Cc <= 3)
                        {
                            if (aux_sai1 == "G")
                            {
                                if (Cu > 4)
                                {
                                    aux_sai2 = "W";
                                }

                            }
                            if (aux_sai1 == "S")
                            {
                                if (Cu > 6)
                                {
                                    aux_sai2 = "W";
                                }

                            }
                        }

                        saida = ("Classiicação do solo: " + aux_sai1 + aux_sai2 + ".");
                        Toast.makeText(getActivity(), saida, Toast.LENGTH_LONG).show();
                    }

                    // ******* Caixa 2
                    if (aux_usc_P200 > 5 && aux_usc_P200 <= 12) {
                        // Verifica G ou S
                        aux_cont1 = 100 - aux_usc_P4;
                        aux_cont2 = aux_usc_P4 - aux_usc_P200;
                        if (aux_cont1 > aux_cont2) {
                            aux_sai1 = "G";
                        }
                        if (aux_cont1 < aux_cont2) {
                            aux_sai1 = "S";
                        }

                        // Verifica W ou P
                        aux_sai2 = "P";
                        Cu = aux_usc_FI60 / aux_usc_FI10;
                        Cc = (aux_usc_FI30 * aux_usc_FI30) / (aux_usc_FI60 * aux_usc_FI10);
                        if (Cc >= 1 && Cc <= 3) {
                            if (aux_sai1 == "G") {
                                if (Cu > 4) {
                                    aux_sai2 = "W";
                                }

                            }
                            if (aux_sai1 == "S") {
                                if (Cu > 6) {
                                    aux_sai2 = "W";
                                }

                            }
                        }

                        // Verifica se é C ou M
                        aux_cont1 = 0.73 * (aux_usc_LL - 20);
                        if (aux_usc_IP > 7 && aux_usc_IP > aux_cont1)
                        {
                            aux_sai3 = "C";
                        }
                        if (aux_usc_IP <= 7)
                        {
                            aux_sai3 = "M";
                        }
                        if (aux_usc_IP <= aux_cont1)
                        {
                            aux_sai3 = "M";
                        }

                        saida = ("Classiicação do solo: " + aux_sai1 + aux_sai2 + "-" + aux_sai1 + aux_sai3 + ".");
                        Toast.makeText(getActivity(), saida, Toast.LENGTH_LONG).show();
                        }

                    // ******* Caixa 3
                    if (aux_usc_P200 > 12 && aux_usc_P200 <= 50)
                    {
                        // Verifica G ou S
                            aux_cont1 = 100 - aux_usc_P4;
                            aux_cont2 = aux_usc_P4 - aux_usc_P200;
                            if (aux_cont1 > aux_cont2) {
                                aux_sai1 = "G";
                            }
                            if (aux_cont1 < aux_cont2) {
                                aux_sai1 = "S";
                            }
                        // Verifica se é C ou M
                        aux_cont1 = 0.73 * (aux_usc_LL - 20);
                        if (aux_usc_IP > 7 && aux_usc_IP > aux_cont1)
                        {
                            aux_sai3 = "C";
                        }
                        if (aux_usc_IP <= 7)
                        {
                            aux_sai3 = "M";
                        }
                        if (aux_usc_IP <= aux_cont1)
                        {
                            aux_sai3 = "M";
                        }

                        saida = ("Classiicação do solo: " + aux_sai1 + aux_sai3 + ".");
                        Toast.makeText(getActivity(), saida, Toast.LENGTH_LONG).show();
                    }

                    // ******* Caixa 3
                    if (aux_usc_P200 > 50)
                    {
                        // Verifica se é C, M ou C-M
                        aux_cont1 = 0.73 * (aux_usc_LL - 20);
                        if (aux_usc_IP > 7 && aux_usc_IP > aux_cont1)
                        {
                            aux_sai3 = "C";
                        }
                        if (aux_usc_IP <= 4)
                        {
                            aux_sai3 = "M";
                        }
                        if (aux_usc_IP <= aux_cont1)
                        {
                            aux_sai3 = "M";
                        }
                        if (aux_usc_IP > aux_cont1 && aux_usc_IP > 4 && aux_usc_IP <= 7)
                        {
                            aux_sai3 = "A";
                        }

                        // Verifica se é H ou L
                        if (aux_usc_LL > 50)
                        {
                            aux_sai4 = "H";

                            if(aux_sai3 == "C")
                            {
                                saida = ("Classiicação do solo: " + aux_sai3 + aux_sai4 + ".");
                                Toast.makeText(getActivity(), saida, Toast.LENGTH_LONG).show();
                            }

                            if(aux_sai3 == "M")
                            {
                                saida = ("Classiicação do solo: " + aux_sai3 + aux_sai4 + " ou OH.");
                                Toast.makeText(getActivity(), saida, Toast.LENGTH_LONG).show();
                            }
                        }

                        if (aux_usc_LL <= 50)
                        {
                            aux_sai4 = "L";

                            if(aux_sai3 == "C")
                            {
                                saida = ("Classiicação do solo: " + aux_sai3 + aux_sai4 + ".");
                                Toast.makeText(getActivity(), saida, Toast.LENGTH_LONG).show();
                            }

                            if(aux_sai3 == "M")
                            {
                                saida = ("Classiicação do solo: " + aux_sai3 + aux_sai4 + " ou OL.");
                                Toast.makeText(getActivity(), saida, Toast.LENGTH_LONG).show();
                            }

                            if(aux_sai3 == "A")
                            {
                                saida = ("Classiicação do solo: CL - ML.");
                                Toast.makeText(getActivity(), saida, Toast.LENGTH_LONG).show();
                            }
                        }
                    }

            }
            else
                {
                    // Montando texto de saída
                    saida = ("Alguns parâmetros de entrada não foram preenchidos. Favor verificar a entrada de dados");
                    Toast.makeText(getActivity(), saida, Toast.LENGTH_LONG).show();
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
