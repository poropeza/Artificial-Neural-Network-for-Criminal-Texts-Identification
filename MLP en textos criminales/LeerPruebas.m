function [ x ] = LeerPruebas( archivo_ , x , valores_sentencias)


archivo = fopen(archivo_,'r');
cont_bact=0;

cont_palabras=0;

cont_linea=1;

palabra='';


data = fgetl(archivo);%me posiciono en la primer linea del archivo
while ischar(data)
           
        suma_linea=0;
    
    [filas,~]=size(x);
    
    
     if ~isempty(strfind(data,'knife'))
            suma_linea=suma_linea+valores_sentencias(1,1);
     end
     
     if ~isempty(strfind(data,'robbery'))
            suma_linea=suma_linea+valores_sentencias(1,2);
     end
     
     if ~isempty(strfind(data,'drug'))
            suma_linea=suma_linea+valores_sentencias(1,3);
     end
     
      if ~isempty(strfind(data,'heroin'))
            suma_linea=suma_linea+valores_sentencias(1,4);
     end
     
     if ~isempty(strfind(data,'cocaine'))
            suma_linea=suma_linea+valores_sentencias(1,5);
     end
     
     if ~isempty(strfind(data,'gun'))
            suma_linea=suma_linea+valores_sentencias(1,6);
     end
     
      if ~isempty(strfind(data,'burn'))
            suma_linea=suma_linea+valores_sentencias(1,7);
     end
     
     if ~isempty(strfind(data,'kill'))
            suma_linea=suma_linea+valores_sentencias(1,2);
     end
     
     if ~isempty(strfind(data,'kidnapp'))
            suma_linea=suma_linea+valores_sentencias(1,3);
     end
    

    x(cont_linea,1)=suma_linea;
    
   
      
    
    data = fgetl(archivo);  %me muevo a la siguiente linea  
    cont_linea=cont_linea+1;
           
    data = fgetl(archivo);  %me muevo a la siguiente linea  

end

%x

fclose(archivo);





end

