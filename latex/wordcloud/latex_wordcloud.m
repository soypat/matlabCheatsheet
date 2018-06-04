function [] = latex_wordcloud(filename)
%Crea un wordcloud de las funciones de un archivo latex
%Ejemplo:  latex_wordcloud('latextext.txt')
%          latex_wordcloud('mi_TP_de_fisica_4.tex')
%Version R2017b y adelante
fileID=fopen(filename);
doubleskip=false;
unpermitted={'\','{',"}",'^',' ','%','_',')','(','$','&','=',',','.','[',']','<','>','?','/',"'"};
if fileID==-1
    fprintf('\nOpen Failure... Exiting\n\nAsegurese de que escribio bien el archivo y que esta en la carpeta.\n');
    return
end
isbegin=0;
try
    wordarray={};
    currentline=0;
while feof(fileID)==0
    currentline=currentline+1;
    rline=(fgetl(fileID));
    endline=length(rline);
    backslashpos=strfind(rline,'\');
    for i=1:length(backslashpos)
        if doubleskip==true
            doubleskip=false;
            continue
        end
        currpos=backslashpos(i);
        if currpos==endline %no queremos exceder indice de matriz
            break
        elseif rline(backslashpos(i)+1)=='\'  %No quiero leer un salto '\\'
            doubleskip=true; %salteamos el proximo tambien
            continue
        end
        
        try
        if rline(currpos+1:currpos+5)=='begin' %aca encuentro funciones \begin{func}
            isbegin=1; 
            currpos=currpos+7;
        end
        catch
        end
        
        for j=(currpos+1):endline
            try
            if rline(currpos+1:currpos+3)=='end'%si es un \end{func} lo salteo
                endpos=endline;
                isbegin=-1;
                break
            end
            catch
            end
            
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
        if isbegin==0
            word=rline(currpos:endpos);
        else
            word=strcat('\begin{',rline(currpos:endpos),'}');
        end
        if (endpos-currpos)>2 && isbegin~=-1
            wordarray=[wordarray,word];
        end
        isbegin=0;
    end
end%END OF WHILE
C=categorical(wordarray);
clearvars wordarray
figure
wordcloud(C);
titlename=strcat('Wordcloud de funciones LaTeX en el archivo ',':',filename);
title(titlename)
catch e
    fclose('all');
    fprintf('Error en main: %s\nLinea %0.0f del archivo %s\n',e.message,currentline,filename);
end
fclose('all');
end

