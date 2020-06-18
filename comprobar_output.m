%A=[1 0 0; 1 0 0; 0 1 0;0 0 1; 0 0 1 ; 0 0 0];
A=optimo;
I=[0 0 0; 0 0 1;0 1 0;0 1 1;1 0 0;1 0 1;1 1 0;1 1 1];
P=length(A)-3;
OA=zeros(1,8);
estado=zeros(P+3,1); %OA provisional, al pasar por cada puerta
for j=1:length(I)
    estado(1:3)=I(j,:); %coge fila por fila de los inputs
    for i=1:P %num puertas
        filas=find(A(:,i)); %nos devuelve un vector con las filas que
            %tienen un 1 en cada columna de la matriz de adyacencia
            %(o sea las entradas de cada puerta)
%         if length(filas)==2
            salida=sum(estado(filas));
            if salida==0
                estado(3+i)=1;
            else
                estado(3+i)=0;
            end
            
%         elseif length(filas)==1 %solo una entrada en una puerta = puerta NOT
%             salida=estado(filas);
%             if salida==0
%                 estado(3+i)=1;
%             elseif salida==1
%                 estado(3+i)=0;
    end
    OA(j)=estado(end)
end