function PerceptronMulticapa()

%limpiar memoria y consola
clear
clc

%% Entrada

x=[];%arreglo de entrada

%entrada de archivo-----

archivo = fopen('secuenciaciones_bacterias.txt','r');%archivo de entrenamiento con sentencias criminales y normales

sentencias_criminales = {'knife','robbery','drug','heroin','cocaine','gun','burn','kill','kidnapp'};
sentencias_criminales=char(sentencias_criminales);
valores_sentencias=[0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9];
cont_palabras=0;
cont_linea=1;
palabra='';

%sentencias_criminales(1,:)

data = fgetl(archivo);%me posiciono en la primer linea del archivo
while ischar(data)
    
    suma_linea=0;
    
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
    
    if ~isempty(strfind(data,'0'))
        x(cont_linea,2)=0;    
    elseif ~isempty(strfind(data,'1'))
        x(cont_linea,2)=1;
    end       
    
    data = fgetl(archivo);  %me muevo a la siguiente linea  
    cont_linea=cont_linea+1;
    
end

fclose(archivo);

%x

%% Entrenamiento

%porcentaje de aprendizaje (velocidad para converger)
alfa=0.25;

%n va a tener la misma cantidad de neuronas que las columnas de entrada
[n,nn] =  size(x);
nn=nn-1;

w=[];%este se tiene que llenar como de forma aleatoria, si es que no se ha entrenado
v=[];%este se tiene que llenar como de forma aleatoria, si es que no se ha entrenado

%Inicialización de pesos W
for i=1:nn  
	for j=1:nn	 
		w(i,j)=rand;
    end
end

%Inicialización de pesos V
for i=1:nn 
	v(1,i)=rand; 
end

%Ciclo de entrenamiento
for i=1:n 
    
	aprender=1;	
	h=[];

	while  aprender==1
        
		for s=1:nn		 
			h(1,s) = hi(w, x(i,:), i);
        end

		o= Ok(h,v);

		if o==x(i,nn+1) %la columna representa el valor esperado de un registro de aprendizaje		
			aprender=0;		
        else %se deben de actualizar los pesos hasta llegar al objetivo		
			error_=error(x(i,nn+1),o);

			if error_<0			
				error_=error_*-1;
            end

			if error_<=0.01 %le doy un margen de aprendizaje permitido. 			
				aprender=0;			
            else %tiene que aprender			
				deltaK_=deltaK(x(i,nn+1),o);
				v=Vnuevos(v,alfa,h,deltaK_);%actualizo los pesos de V
				deltaJ_=deltaJ(h,deltaK_,v);%obtengo el arreglo de deltaJ
				w=Wnuevos(w, alfa,h, deltaJ_);%actualizo los pesos de W
            end
        end	        
    end
end

%% Predicciones

x_posterior=[];

x_posterior = LeerPruebas('prueba.txt',x_posterior,valores_sentencias);

[ff,~]=size(x_posterior);
h_=[];

es_criminal=0;

for i=1:ff

	for j=1:nn		
		h_(1,j)=hi(w, x_posterior(i,:), i);
    end   

	o = Ok(h_,v);

    [indice_real,~]= Clasificar(x,o,v,w);    
    es_criminal=indice_real
       
end

end

