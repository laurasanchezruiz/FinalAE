function fitness=test_function(A)
%A es la matriz de adyacencia
I=[0 0 0; 0 0 1;0 1 0;0 1 1;1 0 0;1 0 1;1 1 0;1 1 1];
OC=[0 0 0 1 0 1 0 1];%salidas de la última puerta, output que buscamos (el correcto)
P=length(A)-3; %numero de elementos (puertas) que tiene el circuito (ya que tenemos 3 inputs)

%output del circuito aleatorio A
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
    OA(j)=estado(end);
end
%fitness:
    %1 - comparar output bueno (OC) con el del circuito descrito por la
    %matriz de adyacencia (OA). Si OC=OA, su resta será un vector de 8
    %ceros. Cuanto más se parezcan menor número de 1 y -1 dará este vector
    %resultante de la resta OC-OA. Con "sum(abs)" lo que hacemos es sumar
    %estos abs(1) y abs(-1) --> nos da el número de diferencias entre OC
    %y OA.
    %2 - coste = número de puertas (número de columnas de la matriz A) +
    %número de conexiones (número de unos que tiene esta matriz)
    
    %pesos: cada una de estas variables influye de manera diferente y esto se
    %representa con pesos. Es mucho más importante que el output sea el
    %correcto/se parezca más al correcto a que el coste sea mínimo, y
    %también suponen mayor coste las puertas que las conexiones. Tenemos
    %que ajustar estos pesos hasta obtener nuestro óptimo.
    
fitness=(sum(abs(OC-OA)))^2+0.0001*(3*P+length(find(A)))^2;

%ESTABA: fit=1*(sum(abs(OC-OA)))^2 + 0.00001*(1-sum(abs(OC-OA)))*(4*P+ length(find(A)))^2;
% fit=1000*(sum(abs(S-V)))^2; 
% if fit==0
%     fit=(E+ length(find(A)))^2;
end
