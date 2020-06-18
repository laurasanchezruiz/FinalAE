%%main
clear all
%%
ff='test_function';
% Creación población inicial (todos los individuos con el mismo número de
% puertas)

popsize=10;
mutrate=0.2; %si se supera, entonces llamo a la funcion mutarL
% - No reemplazamos a todos los individuos, sólo al 60% mejores:
selection = 0.7; % fraction of population kept
%????????????????????????? Nt=npar; % continuous parameter GA Nt=#variables

min_fitness=[];
mean_fitness=[];
max_num_puertas=6;
poblacion={};
for i=1:popsize
    poblacion{i}=nuevo_individuo(max_num_puertas);
end
keep=floor(selection*popsize); % #population memberst that survive

vector_fitnesses=[];
for i=1:length(poblacion)
    individuo=poblacion{i};
    fitness=test_function(individuo);
    vector_fitnesses(i)=fitness;
end
mejor_fitness=sort(vector_fitnesses);
min_fitness(1)=mejor_fitness(1);
mean_fitness(1)=sum(vector_fitnesses)/length(vector_fitnesses);

iteraciones=200;
for k=1:iteraciones
    disp(k)
    poblacion_seleccionada=seleccionarL(poblacion,keep);

    % Generar descendencia
    %Aparear aleatoriamente de 2 en 2, para generar descendencia. Mantener
    %población constante, es decir, si tengo 10 individuos y selecciono 6, de
    %alguna manera estos 6 tendran que recombinarse entre ellos para generar 4
    %hijos en total.
    hijos={};
    parents=poblacion_seleccionada;
    num_parents=length(parents);
    for i=1:(popsize-num_parents)
        P1=parents{randi(num_parents)};
        P2=parents{randi(num_parents)};
        if length(P1(:,1))==length(P2(:,1)) && length(P1(1,:))==length(P2(1,:)) %tienen la misma dimensión
            if P1==P2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%WHILE
                P2=parents{randi(num_parents)};
            end
        end
        hijos{i}=recombinar2(P1,P2);
    end

    % Mutar a los hijos con probabilidad mutrate
    hijos_mut={};
    for i=1:length(hijos)
        hijo=hijos{i};
        prob=rand(1);
        if prob<mutrate %muta
            hijos_mut{i}=mutarL(hijo);
        else %no muta
            hijos_mut{i}=hijo;
        end
    end

    % Agrupar en población a padres e hijos
    poblacion={};
    for i=1:length(parents)
        poblacion{i}=parents{i};
    end
    for i=length(parents)+1:popsize
        for j=1:length(hijos)
            poblacion{i}=hijos{j};
    end
    end
    
    vector_fitnesses=[];
    for i=1:length(poblacion)
        individuo=poblacion{i};
        fitness=test_function(individuo);
        vector_fitnesses(i)=fitness;
    end
    
    mejor_fitness=sort(vector_fitnesses); %ordenamos de menor a mayor
    min_fitness(k+1)=mejor_fitness(1);
    mean_fitness(k+1)=sum(vector_fitnesses)/length(vector_fitnesses);
end

% De toda la población, mirar quién tiene mayor fitness, que será el óptimo

for i=1:length(poblacion)
    individuo=poblacion{j};
    fitness=test_function(individuo);
    if min_fitness==fitness
        optimo=poblacion{i}
    end
end

%_______________________________________________________
% Displays the output
day=clock;
disp(datestr(datenum(day(1),day(2),day(3),day(4),day(5), day(6)),0))
%disp(['optimized function is ' ff])
format short g
% disp(['popsize = ' num2str(popsize) ' mutrate = ' num2str(mutrate) ' # par = ' num2str(npar)])
% disp(['#generations=' num2str(iga) ' best cost=' num2str(cost(1))])
% disp('best solution')
% disp(num2str(par(1,:)))
% disp('continuous genetic algorithm')
figure(1)
iters=0:length(min_fitness)-1;
plot(iters,min_fitness,iters,mean_fitness,'-');
%xlabel('generation'); ylabel('cost');
% text(0,minc(1),'best');
% text(1,minc(2),'population average')

