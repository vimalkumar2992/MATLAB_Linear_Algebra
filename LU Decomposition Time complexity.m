% This script is to test the time complexity for LU decomposition

function vimalkum_hw5_p2()
    n_matrix=logspace(1,3,100);
    solution_matrix=zeros(length(n_matrix),2);

    for i  = 1:length(n_matrix)
        n=floor(n_matrix(i));
        A = rand(n,n) + n*eye(n);
        tic;
        [~, ~] = vimalkum_hw5_p1(A);
        t=toc;
        solution_matrix(i,1)=n;
        solution_matrix(i,2)=t;
    end

    loglog(solution_matrix(:,1),solution_matrix(:,2))
    grid
    title('Order of matrix vs Time taken for LU decomposition')
    xlabel('Log - Order of matrix')
    ylabel('Log - Time taken for LU decomposition')
end


% Inference:
% As the order of the matrix increases, the time taken for LU decomposition
% increases at a higher rate. While looking at the loglog plot, its evident 
% that while the order of the matrix increases from n to n^2, the time take 
% for LU decomposition increases from m to little short of m^3. This shows 
% the overall time taken is dependent on the order of matrix raised to the 
% power 3, but slightly lesser. The actual time constraint is 2/3 (order^3)
% 
% Does the trend hold for smaller matrix?
% Whie running this plot multiple times, I see that the plot is little 
% noisy while n is less, this could be due to LU decomposition time being 
% miniscule, and other system times influencing this time. 
% 
% for larger matrix?
% While n becomes large, the plot is linear 
