% Defining a function that accepts Adjacency matrix A, i ( source location)
% and j (destination location)

function [length] = vimalkum_hw3_p1(A,i,j)

% Creating a copy of A matrix, for the ease of raising its powers
B = A;
for cnt = 1:20
    % Checking if that route has a path for the current length
    if B(i,j)>0
        % if there is a path, then we are writing the counter to the length
        % variable
        length=cnt;
        % After writing the counter to the length variable, we are exiting
        % the loop
        break
    else
        % if there is no path as of now, we are raising the power of the B
        % matrix 
        B=B*A;
        % After 20 unsuccessful attempts to find a path, we throw the below error 
        if cnt==20
            error('No solution arrived until a path of length 20')
        end
    end
end

end