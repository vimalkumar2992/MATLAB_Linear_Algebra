function [Q,R] = vimalkum_hw5_p3b(A)
    [m,n]=size(A);
    Q = A;
    R = zeros(n,n);

    for i = 1:n
        R(i,i)=norm(Q(:,i));
        Q(:,i)=Q(:,i)/R(i,i);
        for j =i+1:n
            R(i,j)=Q(:,i)'*Q(:,j);
            Q(:,j)=Q(:,j)-R(i,j)*Q(:,i);
        end



    end 
end

