% Função para método USC

function f_USC(handles)
tipo = 'Nenhum solo encontrado.';
cancela = 0;
P200 = get(handles.USC_P200, 'String');
[aux_para, P200] = f_verifica_numero(P200);
if (aux_para == 1)
    cancela = 1;
end
P4 = get(handles.USC_P4, 'String');
[aux_para, P4] = f_verifica_numero(P4);
if (aux_para == 1)
    cancela = 1;
end
LP = get(handles.USC_LP, 'String');
[aux_para, LP] = f_verifica_numero(LP);
if (aux_para == 1)
    cancela = 1;
end
LL = get(handles.USC_LL, 'String');
[aux_para, LL] = f_verifica_numero(LL);
if (aux_para == 1)
    cancela = 1;
end
FI10 = get(handles.USC_FI10, 'String');
[aux_para, FI10] = f_verifica_numero(FI10);
if (aux_para == 1)
    cancela = 1;
end
FI60 = get(handles.USC_FI60, 'String');
[aux_para, FI60] = f_verifica_numero(FI60);
if (aux_para == 1)
    cancela = 1;
end
FI30 = get(handles.USC_FI30, 'String');
[aux_para, FI30] = f_verifica_numero(FI30);
if (aux_para == 1)
    cancela = 1;
end

if (cancela == 0)

% Entrada de dados
aux_testaW = 0;

% Se grosso
if (P200 <= 50)
    % Definindo tipos (G ou S)
    aux1 = 100 - P4;
    aux2 = P4 - P200;
    if (aux1 > aux2)
        tipo1 = 'G';
    end
    if (aux1 < aux2)
        tipo1 = 'S';
    end
    
    
    if (P200 <= 12)
        % Entrada de diâmetros
        Cu = FI60/FI10;
        Cc = (FI30 ^ 2)/(FI60 * FI10);
        
        
        if (tipo1 == 'G')
            if (Cu > 4)
                aux_testaW = 1;
            end
        end
        if (tipo1 == 'S')
            if (Cu > 6)
                aux_testaW = 1;
            end
        end
        if (Cc > 1 && Cc <= 3)
            aux_testaW = 1;
        end
        
        if (aux_testaW == 1)
            tipo2 = 'W';
        else
            tipo2 = 'P';
        end
        
    end
    
    if (P200 <= 5)
        tipo = [tipo1 tipo2];
    end
    if (P200 <= 12 && P200 > 5)
         IP = LL - LP;
        aux_calculo = 0.73 * (LL-20);
        if (IP > 7 && IP > aux_calculo)
            tipo3 = 'C';
        end
        if (IP <= aux_calculo || IP <= 7)
            tipo3 = 'M';
        end
        
        aux_tipo = [tipo1 tipo2 tipo1 tipo3];
    end
    if (P200 > 12 && P200 <= 50)
       IP = LL - LP;
        aux_calculo = 0.73 * (LL-20);
        if (IP > 7 && IP > aux_calculo)
            tipo3 = 'C';
        end
        if (IP <= aux_calculo || IP <= 7)
            tipo3 = 'M';
        end
        
        tipo = [tipo1 tipo3];
        
    end
end

% Se fino
if (P200 > 50)
    IP = LL - LP;
    if (LL > 50)
        tipo5 = 'H';
    end
    if (LL <= 50)
        tipo5 = 'L';
    end

    aux_calculo = 0.73 * (LL-20);
    tipo4 ='A';
    if (IP > 7 && IP > aux_calculo)
        tipo4 = 'C';
    end
    if (IP <= 4 || IP <= aux_calculo)
        tipo4 = 'M';
    end
    aux_O = 'O';
    if (tipo4 == 'M')
        tipo = [tipo4 tipo5 ' ou ' aux_O tipo5];
    end
    
    if(tipo4 == 'C' && tipo5 == 'L')
        tipo = [tipo4  tipo5];
    end
    
    if(tipo4 == 'C' && tipo5 == 'H')
       tipo = [ tipo4 tipo5];
    end
    
    if (IP < 4 && IP <= 7 && IP > aux_calculo)
        tipo4 = 'C-M';
        tipo = 'CL-ML';
    end
end

set(handles.soloeh, 'String', tipo);

else
    errordlg('Digite valores numéricos maiores/iguais a 0!')
end % cancela



end % function
