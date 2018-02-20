%-------------------------------------------------------------------------%
syms x y %Para trabajar con la funcion latex de matlab hay que declarar los
         %variables que se van a usar como simbolicos
valoresZ=peaks(100); %Devuelve 100x100 valores de la funcion prueba de Matlab
xval=1:100;
yval=1:100;
surf(xval,yval,valoresZ); %Grafico la superficie de peaks con un mapa 100x100
z =  3*(1-x)^2*exp(-(x^2) - (y+1)^2) ... 
   - 10*(x/5 - x^3 - y^5)*exp(-x^2-y^2) ... 
   - 1/3*exp(-(x+1)^2 - y^2); %Funcion graficada (es peaks)
title(['La ecuacion: $ ' latex(z) ' $'],'Interpreter','latex')
%Pongo lo que se va hacer pasar por el compilador de latex entre los
%corchetes

