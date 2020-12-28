function [ z ] = Ok( h,v )%h es un arreglo y v tambien

    z=0;
	n = length( h );
	
   for i=1:n 
		z=z+h(1,i)*v(1,i);
   end

	z= sigmoidal(z);


end

