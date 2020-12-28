function [w]= Wnuevos(w, alfa, h, deltaJ)% se actualiza w
    
   [filas,columnas] = size(w);
    
   for i=1:filas	 
        for j=1:columnas		 
			w(i,j)=w(i,j)+alfa*h(1,i)*deltaJ(j);
        end		
    end


end

