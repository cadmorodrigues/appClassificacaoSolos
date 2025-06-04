% Função para definição de solo via método TRB

function f_TRB(handles)

tipo = 'Nenhum solo encontrado.';
cancela = 0;
P200 = get(handles.TRB_P200, 'String');
[aux_para, P200] = f_verifica_numero(P200);
if (aux_para == 1)
    cancela = 1;
end
P40 = get(handles.TRB_P40, 'String');
[aux_para, P40] = f_verifica_numero(P40);
if (aux_para == 1)
    cancela = 1;
end
LP = get(handles.TRB_LP, 'String');
[aux_para, LP] = f_verifica_numero(LP);
if (aux_para == 1)
    cancela = 1;
end
LL = get(handles.TRB_LL, 'String');
[aux_para, LL] = f_verifica_numero(LL);
if (aux_para == 1)
    cancela = 1;
end
P10 = get(handles.TRB_P10, 'String');
[aux_para, P10] = f_verifica_numero(P10);
if (aux_para == 1)
    cancela = 1;
end

IP = LL - LP;

if (cancela == 0)
%%% Testes dos tipos
% A.7-6
if (LL > 40 && IP > 10 && IP > (LL-30))
    tipo = 'A.7-6';
end

% A.7-5
if (LL > 40 && IP > 10 && IP <= (LL-30))
    tipo = 'A.7-5';
end

% A.6
if (P200 > 35 && LL <= 40 && IP > 10)
    tipo = 'A.6';
end

% A.5
if (P200 > 35 && LL > 40 && IP <= 10)
    tipo = 'A.5';
end

% A.4
if (P200 > 35 && LL <= 40 && IP <= 10)
    tipo = 'A.4';
end

% A.2-7
if (P200 <= 35 && LL > 40 && IP > 10)
    tipo = 'A.2-7';
end

% A.2-6
if (P200 <= 35 && LL <= 40 && IP > 10)
    tipo = 'A.2-6';
end

% A.2-5
if (P200 <= 35 && LL > 40 && IP <= 10)
    tipo = 'A.2-5';
end

% A.2-4
if (P200 <= 35 && LL <= 40 && IP <= 10)
    tipo = 'A.2-4';
end

% A.3
if (P40 > 50 && P200 <= 10 && LL == 0 && IP <= 0)
    tipo = 'A.3';
end

% A.1-b
if (P40 <= 50 && P200 <= 25 && IP <= 6)
    tipo = 'A.1-b';
end

% A.1-a
if (P10 <= 50 && P40 <= 30 && P200 <= 15 && IP <= 6)
    tipo = 'A.1-a';
end

IG = f_IG(P200, LL, IP)
tipo =  [tipo '(' num2str(IG) ')'];
set(handles.soloeh, 'String', tipo);

else
    errordlg('Digite valores numéricos maiores/iguais a 0!')
end % cancela

end % function
