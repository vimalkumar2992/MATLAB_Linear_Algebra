% Clearing the variables in cache and the command window
% Converting the way how MATLAB shows the decimal points
clc
clear
format long
% Defining a function func, with a parameter X
% Variable definitions 
func=@(x) sin(x);
x=pi/3;
func_derivative=cos(x);
% Looping across different step sizes 
% for every stepsize arithmetic derivative is computed
% the difference between the arithmetic method and derivative is computed
% every stepsize and error is written into an array

steps=50;
y=logspace(-16,-1,steps);

%If we use VPA, the calculation considers the values to least significant digits, that is coming from digit function
% y=vpa(logspace(-16,-1,steps));
% So smaller the step size, better the accuracy

for i=1:steps
    h=y(i);
    a=x+h;
    func_derivative_arithmetic(i)=(func(a)-func(x))/h;
    err(i)=abs(func_derivative_arithmetic(i)-func_derivative);
end

% Plotting log of step size against log of error 
% Adding title and axis labels

loglog(y,err)
grid
title('Stepsize vs Error')
xlabel('Log - Stepsize')
ylabel('Log - Error')

% The inference after looking at the graph is that, at 10e-8 (9.103e-9) stepsize the
% difference between the actual derivative and the arithmetic derivative is
% the least, thus that seems to be the best step size for the arithmetic
% calculation


% However below stepsize of 10e-8 (without VPA), the error increases
% as it requires higher number of significant digits to be represented,
% which is introducing truncation error

% VPA overrules the default significant digit allocations, and allocates the
% required number of significant digits, resulting in lesser errors while
% step size is decreased



    