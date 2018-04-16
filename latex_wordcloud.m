function [] = latex_wordcloud(filename)
%Crea un wordcloud de las funciones de un archivo latex
fileID=fopen(filename);
unpermitted={'\','{',"}",'^',' ','%','_',')','(','$','&','=',',','.','[',']','<','>','?','/',"'"};
if fileID==-1
    fprintf('\nOpen Failure... Exiting\n\nAsegurese de que escribio bien el archivo y que esta en la carpeta.\n');
    return
end
try
    wordarray={};
    currentline=0;
while feof(fileID)==0
    currentline=currentline+1;
    rline=(fgetl(fileID));
    endline=length(rline);
    backslashpos=strfind(rline,'\');
    for i=1:length(backslashpos)
        currpos=backslashpos(i);
        if currpos==endline %no queremos exceder indice de matriz
            break
        end
        if rline(backslashpos(i)+1)=='\' %No quiero leer un salto '\\'
            continue
        end

        for j=(currpos+1):endline 
            if j==endline
                switch rline(j)
                    case unpermitted
                        endpos=j-1;
                    otherwise
                        endpos=j;
                end
                break
            end
            switch rline(j)
                case unpermitted
                    endpos=j-1;
                    break
                otherwise
                    continue
            end
        end
        if (endpos-currpos)>2
            wordarray=[wordarray,rline(currpos:endpos)];
        end
    end
end%END OF WHILE
C=categorical(wordarray);
clearvars wordarray
figure
wordcloud(C);
titlename=sprintf('Wordcloud de funciones LaTeX en el archivo %s',filename);
title(titlename)
catch e
    fclose('all');
    fprintf('Error en main: %s\nLinea %0.0f del archivo %s\n',e.message,currentline,filename);
end
fclose('all');

end

