columnas=length(hijo(1,:)); %num de puertas
filas=length(hijo(:,1)); %columnas+3

conex=numel(find(hijo));
while 1
    col=randi(columnas);
    row=randi(filas);
    if hijo(row,col)==1
       hijo(row,col)=0;  %elimina conexion
       break
    else
        continue
    end
end

conex1=numel(find(hijo));