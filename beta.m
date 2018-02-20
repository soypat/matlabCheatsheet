%------------------------------------------------------------------------%
colormap('default');
Matriz1=randi(64,50,100); %Hay 64 colores en el colormap
image(Matriz1)
%------------------------------------------------------------------------%
figure
colormap([0,0,0;0.5,0.5,0.5;1,1,1]) %Las filas son los distintos colores
                            %(valores en RGB) En este caso, negro, gris,
                            %blanco
Matriz2=randi([1,3],34); %Esta matriz de 34x34 tiene indices que refieren a las filas del colormap
image(Matriz2)
%------------------------------------------------------------------------%
figure
Matriz3=imread('windows.jpg'); %Esta matriz de 1200x1920x3, con numeros del 0 al 255 
                         %Tiene los valores RGB para cada pixel
Matriz3(200:400,:,2)=255; %puedo modificar la matriz como siempre 
                    %Hago que color verde sea máximo en esta zona
Matriz3(:,1200:1400,:)=[];%Corto una franja vertical de 1400-1200 pixeles
      
image(Matriz3)

SoyElMapa=winter;

%-------------------------------------------------------------------------%

imwrite(Matriz1,winter,'TuNombreParaImagen.png') %Guarda la imagen en formato
                          %png, que si bien es pesado, no pierde información
                          %Los otros formatos tambien están disponibles
