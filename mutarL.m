function hijo_m=mutarL(hijo)

%1-Cambiar número de puertas (añadir o eliminar). Num puertas = num columnas
prob_mut1=rand(1);
columnas=length(hijo(1,:)); %num de puertas
filas=length(hijo(:,1)); %columnas+3
if prob_mut1<0.5 %añadir puerta
    nueva_puerta=randi([0,1],columnas+3,1);
    hijo_m=[hijo,nueva_puerta]; %hijo mutado con columna añadida
    hijo_m(filas,:)=randi([0,1],1,columnas+1);%añadir abajo una fila nueva
    hijo_m=triu(hijo_m,-2);
    
else %eliminar puerta
    col=randi(columnas);
    hijo(:,col)=[]; %columna (puerta) eliminada
    hijo_m=hijo;
    hijo_m(col,:)=[]; %eliminar la fila correspondiente a la puerta que hemos eliminado
    hijo_m=triu(hijo_m,-2);
end
    

%2-Conexiones (añadir o eliminar)
conex=numel(find(hijo)); %número de conexiones
prob_mut2=1-prob_mut1;


%añadir/eliminar conexiones

end