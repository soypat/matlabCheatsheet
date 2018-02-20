VectorX=linspace(3,29,17);  %linspace: vector de 17 elementos igualmente
                                 %espaciados del 3 hasta el 17 inclusive

VectorY=[1:17].^2;          %vector de los cuadrados de 1 a 17 inclusive

MatrizB=randi(14,17,3);     %randi: genera una matriz 10x3 con números 
                                %pseudo aleatorios del 1 al 14 
C=randi([8,10],17,3);       %Idem pero solo numeros entre 8 y 10 inclusive

TuFuncionAnonima=@(X) cos(3*X).*X;  %Definición de función anonima. 
                             %Esta en particular funciona si X es un vector
                             %Pero eso no es necesesario
%-------------------------------------------------------------------------%

subplot(2,2,1),     plot(VectorX,VectorY,'sg')       %  s=square, g=green
grid on

subplot(2,2,2),     plot(VectorX,MatrizB,'y*')       %plotea
'--k')
ylabel('cos(5x)')
xlabel('x')

subplot(2,2,4),     plot(C)

subplot(2,2,3),     fplot(TuFuncionAnonima,[0,2*pi],
title('2-D Line Plot')
ylim([7,11])
