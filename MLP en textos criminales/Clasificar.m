function [ z,indice ] = Clasificar(x,prueba,v,w)%aqui clasifica y predice lo que es

    h=[];
	[n,nn] =  size(x);    
    nn=nn-1;

	indice=0;
    menor=999;
    
   for i=1:n 	 
        for s=1:nn 			
			h(1,s)=hi(w, x(i,1:1),i);
        end
       
		o = Ok(h,v);

		error_=error(o,prueba);

		if error_<0 
		
			error_=error_*-1;
        end

		if i==1		
			menor=error_;
			indice=1;
        end

		if error_<menor		
			menor=error_;
			indice=i;
        end
    end

	z = x(indice,nn+1);%posicion de mi etiqueta que quiero predecir

end

