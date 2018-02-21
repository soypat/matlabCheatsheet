function [ output_args ] = calorev(an,bn,mx,parametros)
%CALOREV ------  v1 abril 2017
%Grafica ecuacion de calor para una barra.
%Toma input en string. Primer input es an, segundo es bn. (en funcion de n solamente)
%El tercer input es la particular en funcion de x solamente. 
%Si la funcion es nula, ingresar '0'. Usar L para longitud de la barra.
%
%Ejemplos:
%   calorev('0','(-1+(-1).^n)*20/(pi*n)','-10+20*x/L',3)
%
%   calorev('0','(-1-(-1).^n)*20/(pi*n)','-10+20*x/L',[1.4 40 4 0 1])
% 
%SUBPARAMETROS (opcionales)
%   Vector parametro de forma:
%   [TiempodeGrafico FactorSloMo  Iteraciones  LongitudBarra  CFactorTermico]
%   Se puede ingresar de 0 a 5 valores de parametros numericos positivos.
%   Ingresar valor 0 para usar valor default.
%
%
%TiempodeGrafico: Cuanto dura la animacion en segundos. No puede ser menor a 1
%FactorSloMo: Cuanto se va reducir la velocidad de animacion. Cuanto mayor
%sea, mas lento se vera la difusion de calor.
%Iteraciones: Cuantas veces se suma la serie fourier. Ayuda cuando se ve
%mucho ruido en el grafico.
%Fijese en el segundo ejemplo que con k bajo se puede graficar bien.

%Valores DEFAULT
timetofinish=5;%Cuanto dura la animacion
timediv=60;%Cuanto mas alto, mas lento va (tiene que ser mayor a cero)
klim=20; %Iteraciones
L=3;
c=1; %Thermal Diffusivity
if nargin>3
    try
        if parametros(1)>1
           timetofinish=parametros(1);
        end
    catch
    end
    try
        if parametros(2)>0
            timediv=parametros(2);
        end
    catch
    end
    try
        if parametros (5)>0
        c=parametros(5);
        end
    catch

    end
    try
        if parametros(4)>0
            L=parametros(4);
        end
    catch
        L=3;
    end
    try
        zip=parametros(3);
        if zip>0 && (mod(zip,2)==0 || mod(zip+1,2)==0)
            klim=parametros(3);
        end
    catch
    end
end %nargin>3
err=0;errdict=['la expresion de an' 'la expresion de bn' 'la expresion de la particular'];
try
    charan=strcat('an=@(n)',an,';');
    eval(charan);
    err=1;
    charbn=strcat('bn=@(n)',bn,';');
    eval(charbn);
    err=2;
    charul=strcat('ul=@(x)',mx,';');
    eval(charul);
catch
fprintf('No se leyo bien %s\n\n',errdict(1+err))
end
as=0;
bs=0;
sum=0;
speedup=(.02*timediv).^-1;
frames=30*timetofinish;
xv=linspace(0,L,200);
yv=zeros(200,1);
% plot(1,1,'w');

% regimen permanente=5*tau;


hold on
for t=0:frames %Frames (t)
    
    for m=1:200
        x=L*(m-1)/199;
        sum=0;
        for i=1:klim
           ks=i*pi/L;
           as=feval(an,i);
           bs=feval(bn,i);
           sum=(as*cos(ks*x)+bs*sin(ks*x))*exp(-(t/timediv)*(ks*c).^2)+sum;
        end
        sum=sum+feval(ul,x);
        yv(m)=sum;     
    end
    pause(.033) % FPS del grafico. Default en .033 ~= 30fps
    cla
    xlabel(sprintf('Velocidad de tiempo x%3.2f',speedup))
    plot(xv,yv)
    hold on
    pause(.02)
    axis manual
   
end
end
