%Esto viene ser un bench test para el paquete parallel pooling de matlab
%que basicamente permite aprovechar de varios cores para hacer trabajos
%concurrentes. Tipo multitasking.

%parfor hace for en paralelo y parfeval evalua funciones en paralelo
%Se supone que uno puede asi determinar los beneficios de cada funcion.
%Va ser aparente que parfeval es mejor para trabajos pesados donde no hay
%mucha iteracion y vice versa.
parfev=zeros(10);
parforv=zeros(10);
simple=zeros(10);
wait=waitbar(Nc/10,'Loading...');
for Nc=1:10
    for Dc=1:10
        N=2^Nc;
        D=2^Dc;
        dasfun=@inv;
        tic
        waitbar(Nc/10,wait,sprintf('Task #%1.1f para N=%1.1f with difficulty %0.1f',Dc,N,D));
        for i=1:N
            a=rand(D);
            b=inv(a);
        end
        simple(Nc,Dc)=toc;
        clear a and b
        tic
        parfor i=1:N
            a=rand(D);
            b=inv(a);
        end
        parforv(Nc,Dc)=toc;
        clear a and b
        tic
        for i=1:N
            a=rand(D);
            b=parfeval(@inv,1,a);
        end
        parfev(Nc,Dc)=toc;
        clear a and b
        %N=10, D=10000
        %st=150
        %parfor=180
        %parfeval=110
    end
end
close(wait);

% plot(xval,parforv(10,:))
% hold on
% plot(xval,parfev(10,:))
% title('Fixed N=1024 loops for different work size D')
% xlabel('D [square matrix dimension DxD]')
% ylabel('Time to finish work batch in seconds')
% legend('Blue is parfor, Red is parfeval')