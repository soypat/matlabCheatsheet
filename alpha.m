A=[1:10].^2;
B=randi(11,20,1);
C=randi([8,10],10,3);
tufuncion=@(x)cos(3*x)*x;

subplot(2,3,1),plot(A,':g')
grid on
subplot(2,3,2),plot(B,'y*')
subplot(2,3,3),fplot(tufuncion,[0,2*pi],'--k')
subplot(2,3,4),plot(C)
title('2-D Line Plot')
xlabel('x')
ylabel('cos(5x)')
ylim([7,11])
