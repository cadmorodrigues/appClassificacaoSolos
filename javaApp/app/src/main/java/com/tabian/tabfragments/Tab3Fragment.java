package com.tabian.tabfragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.Toast;

public class Tab3Fragment extends Fragment {

    private Spinner tipo_solosspinner;

    private static final String TAG = "Tab3Fragment";

    private Button btnTEST;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.tab3_fragment,container,false);

        tipo_solosspinner = (Spinner) view.findViewById(R.id.spinnerINFO);

        ArrayAdapter adapter = ArrayAdapter.createFromResource(getContext(), R.array.tiposs_solos, android.R.layout.simple_spinner_item);
        tipo_solosspinner.setAdapter(adapter);

        btnTEST = (Button) view.findViewById(R.id.btnTEST3);

        btnTEST.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String solo_escolhido = tipo_solosspinner.getSelectedItem().toString();

                if (solo_escolhido.equals("TRB A.1")){
                    Toast.makeText(getActivity(), "Solos granulares sem finos (pedregulho e areia grossa bem graduada, com pouca ou nenhuma plasticidade)", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("TRB A.2-4")){
                    Toast.makeText(getActivity(), "Finos siltosos de baixa compressibilidade.", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("TRB A.2-5")){
                    Toast.makeText(getActivity(), "Finos siltosos de alta compressibilidade.", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("TRB A.2-6")){
                    Toast.makeText(getActivity(), "Finos argilosos de média plasticidade.", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("TRB A.2-7")){
                    Toast.makeText(getActivity(), "Finos argilosos de alta plasticidade.", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("TRB A.3")){
                    Toast.makeText(getActivity(), "Areias finas.", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("TRB A.4")){
                    Toast.makeText(getActivity(), "Solos siltosos com pequena quantidade de material grosso e de argila (baixa compressibilidade LL < 40%).", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("TRB A.5")){
                    Toast.makeText(getActivity(), "Solos siltosos com pequena quantidade de material grosso e argila, rico em mica e diatomita (alta compressibilidade LL > 40%).", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("TRB A.6")){
                    Toast.makeText(getActivity(), "Argilas siltosas medianamente plásticas com pouco ou nenhum material grosso (baixa compressibilidade).", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("TRB A.7-5")){
                    Toast.makeText(getActivity(), "Argilas plásticas com presença de matéria orgânica (alta compressibilidade) | IP <= LL - 30.", Toast.LENGTH_LONG).show();
                }


                if (solo_escolhido.equals("TRB A.7-6")){
                    Toast.makeText(getActivity(), "Argilas plásticas com presença de matéria orgânica (alta compressibilidade) | IP > LL - 30.", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("USC GW-CH")){
                    Toast.makeText(getActivity(), "Pedregulho bem graduado com silte.", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("USC GW-GC")){
                    Toast.makeText(getActivity(), "Pedregulho bem graduado com argila.", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("USC GP-GH")){
                    Toast.makeText(getActivity(), "Pedregulho mal graduado com silte.", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("USC GP-GC")){
                    Toast.makeText(getActivity(), "Pedregulho mal graduado com argila.", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("USC SW-SH")){
                    Toast.makeText(getActivity(), "Areia bem graduada com silte.", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("USC SW-SC")){
                    Toast.makeText(getActivity(), "Areia bem graduada com argila.", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("USC SP-SH")){
                    Toast.makeText(getActivity(), "Areia mal graduada com silte.", Toast.LENGTH_LONG).show();
                }

                if (solo_escolhido.equals("USC SP-SC")){
                    Toast.makeText(getActivity(), "Areia mal graduada com argila.", Toast.LENGTH_LONG).show();
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
