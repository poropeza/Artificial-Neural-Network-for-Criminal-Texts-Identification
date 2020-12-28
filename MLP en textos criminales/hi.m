function [ z ] = hi( w,x, indice_x )%w es la tabla de pesos y $x es el arreglo de entrada

    z=0;
	[n,nn] = size(w);  

	for i=1:n 	
		for j=1:n
		 	z=z+w(j,i)*x(1,i);	 		
        end
    end
    
    z=z/100;
	z = sigmoidal(z);

end

