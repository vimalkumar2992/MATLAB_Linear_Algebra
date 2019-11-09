
solution_matrix=zeros(10,4);
for i = 2:10
    A=hilb(i);
    [Q,~]=vimalkum_hw5_p3a(A);
    classical=norm(Q'*Q-eye(i));
    solution_matrix(i,1)=i;
    solution_matrix(i,2)=classical;
    [Q,~]=vimalkum_hw5_p3b(A);
    modified=norm(Q'*Q-eye(i));
    solution_matrix(i,3)=modified;
    [Q,~]=qr(A);
    inbuilt_qr=norm(Q'*Q-eye(i));
    solution_matrix(i,4)=inbuilt_qr;
    
end 
[m,n]=size(solution_matrix);
solution_matrix=solution_matrix(2:m,:);

semilogy(solution_matrix(:,1),solution_matrix(:,2))
grid
title('Order of matrix vs Error introduced in orthogonalization ')
xlabel('Order of Hilbert matrix')
ylabel('Log of error introduced in orthogonal matrix')
hold on
semilogy(solution_matrix(:,1),solution_matrix(:,3))
hold on
semilogy(solution_matrix(:,1),solution_matrix(:,4))
legend('Classical GS','Modified GS','MATLAB inbuilt QR')
legend('Location','northwest')
