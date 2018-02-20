%------------------------------------------------------------------------%
load semilogDatos.mat
fig=figure;   %Genero el diagrama y lo guardo como fig para editar despues
blk=[0 0 0];  %Guardo el color negro en blk
set(fig,'defaultAxesColorOrder',[blk; blk]) %cambio color de ejes
%------------------------------------------------------------------------%
semilogx(rev,fev1,'b-')
hold on                 %Hace falta tener un hold on
semilogx(rev,fev2,'r-')
semilogx(rev,fev3,'c-') 
semilogx(rev,fev4,'y-')
yl=ylim;                %Guarda los limites del eje para tener referencia
                        %cuando haya un nuevo eje y
title('Mi Gran Grafico')
xlabel('Valor Independiente')
ylabel('Valor Dependiente')
yyaxis right            %Crea un nuevo eje y queda como eje activo
yticks('manual')        %Esto va permitir modificar los ticks del nuevo eje
yticks([fev1(end),fev2(end),fev3(end),fev4(end)]) %Guarda posiciones de los ticks
ylim(yl)                %Iguala limites del nuevo eje al del primer eje
yticklabels({'Azul!' , 'Rojo!', 'Celeste!' ,'Amarillo!'})
ylabel('Los Colores del Arco iris \heartsuit')
grid on
