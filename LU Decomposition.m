% 1. (4 pts)Write your own MATLAB function that accepts a matrix A and 
% computes the LU decomposition of A (without partial pivoting). The
% function call must be [L, U] = ubitname hw5 p1(A). Do not have
% your code output any text to the terminal or return any results other
% than L and U. If your code does not follow these guidelines you will be
% penalized. Hint: Test your code by creating a random matrix, comput-
% ing the LU-Decomposition, and then checking the difference between
% A-L*U. Please upload your function to UBlearns. This problem does
% not require a hardcopy submission.

function [L, U] = vimalkum_hw5_p1(A)
    [m, n] = size(A);
    L=eye(m,min(m,n));
    %L = eye(m,min(m,n));
    U=A;
%     Making the first column compatible with lower triangular matrix
    for i =1:min(m-1,n)
%     For every column, every element has to be made 0 in L
        for j = i+1:m
            % introducing an if statement to handle linearly dependent systems
            if U(i,i) ~=0
                L(j,i)=U(j,i)/U(i,i);
                U(j,i)=0;
                for k = i+1:n
                    U(j,k)=U(j,k)-L(j,i)*U(i,k);
                end
            end
        end
    end
%            
    if m>n
        L=L(:,1:n);
        U=U(1:n,:);
 
    end 

