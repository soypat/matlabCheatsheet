%-------------------------------------------------------------------------%
      
VectorX=1:2:100;
VectorY=1:2:100;
FuncionMultivariable =@(x,y)  (x-40)^2-(y-50)^2;

MatrizZ=zeros(length(VectorX),length(VectorY));
%-------------------------------------------------------------------------%


for i=1:length(VectorX)
    for j=1:length(VectorY)
        MatrizZ(i,j)=FuncionMultivariable( VectorX(i),VectorY(j)  );
        %Este doble ciclo for evalua una funcion en todos los puntos en 
        %una cuadrícula cuyo tamaño depende de VectorX y VectorY
    end
end

        
surf(VectorX,VectorY,MatrizZ);  %Grafico 3D de la imagen de la funcion
                                    %peaks en un dominio de 100x100

                                    
syms x y %Para trabajar con la funcion LaTeX de matlab hay que declarar los
         %variables que se van a usar como simbolicos
z =  3*(1-x)^2*exp(-(x^2) - (y+1)^2) ... 
   - 10*(x/5 - x^3 - y^5)*exp(-x^2-y^2) ... 
   - 1/3*exp(-(x+1)^2 - y^2);
 %Funcion graficada
title(['La ecuacion: $ ' latex(z) ' $'],'Interpreter','latex')
%Pongo lo que se va hacer pasar por el compilador de latex entre los
%corchetes

