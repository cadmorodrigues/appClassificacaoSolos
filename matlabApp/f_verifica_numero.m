% Função para verificar se valor é numérico e positivo
function [aux_para, valor] = f_verifica_numero(valor)

aux_para = 0;
if (isempty(valor) == 0)
   
valor = str2num(valor);

if (isempty(valor) == 1)
    aux_para = 1;
end

end

end % function