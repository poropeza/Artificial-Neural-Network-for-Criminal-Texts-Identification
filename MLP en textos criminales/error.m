function [ z ] = error( d,ok)%d es el valor esperado para el aprendizaje y ok es el valor obtenido de la iteraci�n. (esta funci�n se manda a llamar cuando ok no es == d)

z=d-ok;

end

