function [ z ] = deltaJ(h,deltaK,v)%retorna el arreglo de deltaJ

    z=[];
	n = length( h );

  for i=1:n	
		z(1,i)=h(1,i)*(1-h(1,i))*(v(1,i)*deltaK);
  end

end

