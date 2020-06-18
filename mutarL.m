function hijo_m=mutarL(hijo)

columnas=length(hijo(1,:)); %num de puertas
filas=length(hijo(:,1)); %columnas+3

if rand(1)<=0.5
    %1-Cambiar n�mero de puertas (a�adir o eliminar). Num puertas = num columnas
    
    if rand(1)<=0.5 %a�adir puerta
        nueva_puerta=randi([0,1],columnas+3,1);
        hijo_m1=[hijo,nueva_puerta]; %hijo mutado con columna a�adida
        hijo_m=zeros(filas+1,columnas+1);
        for i=1:filas
            for j=1:columnas+1
                hijo_m(i,j)=hijo_m1(i,j);
            end
        end
        %hijo_m(filas,:)=randi([0,1],1,columnas+1);%a�adir abajo una fila nueva
        %hijo_m=triu(hijo_m,-2);

    else %eliminar puerta
        col=randi(columnas);
        hijo(:,col)=[]; %columna (puerta) eliminada
        hijo_m=hijo;
        hijo_m(col,:)=[]; %eliminar la fila correspondiente a la puerta que hemos eliminado
        hijo_m=triu(hijo_m,-2);
    end
else
    %2-Conexiones (a�adir o eliminar)
    conex=numel(find(hijo)); %n�mero de conexiones
    hijo_m=hijo;
    if rand(1)<=0.5
        while 1
            col=randi(columnas);
            row=randi(filas);
            if hijo(row,col)==0
                hijo_m(row,col)=1; %crea conexion
                comprobar=triu(hijo_m,-2);
                if hijo_m==comprobar
                    continue
                else
                    break
                end
            end
        end

    else
        while 1
            col=randi(columnas);
            row=randi(filas);
            if hijo(row,col)==1
               hijo_m(row,col)=0;  %elimina conexion
               break
            else
                continue
            end
        end
    end
end
           
end