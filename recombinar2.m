function recombinada=recombinar2(P1,P2)
% recombinada = matriz recombinada resultante (hijo)
% P1, P2 = padres, progenitores
prob=0.5;
filas1=length(P1(:,1));
columnas1=length(P1(1,:));
filas2=length(P2(:,1));
columnas2=length(P2(1,:));

if filas1==filas2 %mismas dimensiones
    recombinada=zeros(filas1,columnas1);
    for i=1:filas1
        for j=1:columnas1
            if rand(1)<prob
                recombinada(i,j)=P1(i,j);
            else
                recombinada(i,j)=P2(i,j);
            end
        end
    end
    
elseif filas1~=filas2
    if columnas1>columnas2 %P1>P2
        if rand(1)<prob %nos quedamos con la grande
            recombinada=zeros(filas1,columnas1);
            for i=1:filas1
                for j=1:columnas1
                    if rand(1)<prob
                        recombinada(i,j)=P1(i,j);
                    else
                        if i<filas2 && j<columnas2
                            recombinada(i,j)=P2(i,j);
                        else
                            recombinada(i,j)=P1(i,j);
                        end
                    end
                end
            end
        
        else %nos quedamos con la pequeña
            recombinada=zeros(filas2,columnas2);
            for i=1:filas2
                for j=1:columnas2
                    if rand(1)<prob
                        recombinada(i,j)=P1(i,j);
                    else
                        recombinada(i,j)=P2(i,j);
                    end
                end
            end
        end
        
    else %P1<P2
        if rand(1)<prob %nos quedamos con la grande
            recombinada=zeros(filas2,columnas2);
            for i=1:filas2
                for j=1:columnas2
                    if rand(1)<prob
                        recombinada(i,j)=P2(i,j);
                    else
                        if i<filas1 && j<columnas1
                            recombinada(i,j)=P1(i,j);
                        else
                            recombinada(i,j)=P2(i,j);
                        end
                    end
                end
            end
        else %nos quedamos con la pequeña
            recombinada=zeros(filas1,columnas1);
            for i=1:filas1
                for j=1:columnas1
                    if rand(1)<prob
                        recombinada(i,j)=P1(i,j);
                    else
                        recombinada(i,j)=P2(i,j);
                    end
                end
            end
        end
    end
end
end