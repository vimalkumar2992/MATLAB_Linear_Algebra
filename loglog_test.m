clc;
clear;
format long;

alpha=2;
beta = 0.01;

for i = 1:10
    x(i)=i;
    y(i)=i^alpha+beta;
end

loglog(x,y,'-o')