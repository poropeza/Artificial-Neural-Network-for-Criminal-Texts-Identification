function [v] = Vnuevos(v,alfa,h,deltaK)%atualiza los pesos V

   n = length( v );

   for i=1:n 	
		v(1,i)=v(1,i)+alfa*h(1,i)*deltaK;
   end

end

