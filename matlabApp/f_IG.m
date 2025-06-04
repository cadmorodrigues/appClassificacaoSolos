% Função para o cálculo de IG

function [IG] = f_IG(P200, LL, IP)

% Recebendo valores da área de trabalho e definindo valores importantes
LP = LL - IP;
aux_P200 = P200;
aux_LL = LL;
aux_IP = IP;

%%% Cálculo de IG
% a
if (P200 > 75)
    aux_P200 = 75;
end
if (P200 < 35)
    aux_P200 = 35;
end
a = aux_P200 - 35;

% b
if (P200 > 55)
    aux_P200 = 55;
end
if (P200 < 15)
    aux_P200 = 15;
end
b = aux_P200 - 15;

% c
if (LL > 60)
    aux_LL = 60;
end
if (LL < 40)
    aux_LL = 40;
end
c = aux_LL - 40;

% d
if (IP > 30)
    aux_IP = 30;
end
if (IP < 10)
    aux_IP = 10;
end
d = aux_IP - 10;


IG = .2 * a + .005 * a * c + .01 * b * d;
IG = ceil(IG);

% Devolvendo IG para área de trabalho
assignin('base', 'IG', IG);

end
