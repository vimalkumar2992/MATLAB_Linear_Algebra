% This function is to perform QR decomposition using Classical Gram-Schmidt
% A = [1 2 3; 4 5 6; 7 8 7; 4 2 3; 4 2 2];


function [Q, R] = vimalkum_hw5_p3a(A)
    [m, n] = size(A);
    Q=zeros(m,n);
    R=zeros(n,n);
    for j=1:n
        % taking every basis vector of A
        
        q=A(:,j);
        % projeting the q vector on every vector traversed before
        for i =1:j-1
            R(i,j)=Q(:,i)'*A(:,j);
            % computing the orthogonal component for the current subspace
            q=q-R(i,j)*Q(:,i);
        end
        % computing the 2 norm of the newly formed orthogonal vector
        R(j,j)=norm(q);
        % normalizing the newly formed orthogonal vector
        Q(:,j)=q/R(j,j);
    end
end
