% Defining a function that takes a function of x, limits - a & b as inputs from the user
function [iter,c] = vimalkum_hw1_p1(func,a,b)

% Computing the mid point of the limits provided
c=(a+b)/2;

% Defining the tolerance limit as given in the problem statement
% Tolerance is the smallest different between the limits
tolerance=1e-6;

% Initiating the iteration variable
iter=0;

% Checking if the function of the provided limit results in different signs
if(func(a)*func(b))<0
    % Checking if the distance between the limits are higher than the tolerance
    while b-a> tolerance
        % Checking if the maximum itetaions limit is not reached yet
        if iter<1000
            % Checking if the resultant signs midpoint and a are different
            if(func(c)*func(a))<0
                % If different the new limits are a and c
                b=c;
            else
                % If same the new limits are c and b
                a=c;
            end
            % Computing the new mid point of the limits
            c=(a+b)/2;
            %increasing the iteration count
            iter=iter+1;
        else
            % If it takes more than 1000 iters, an error is shown
            error('The convergence took more than 1000 steps, please provide a different function/limits')
        % Closing the iteration count check loop
        end
    % Closing the while loop    
    end
% If the resultant of the limit has same sign, the below error is shown
else
    error('The limits of the function are resulting in the same sign, Provide limits such that the sign of the resultant function are different')
% Closing the same sign check loop
end

% Closing the function
end

% How to call this function?
% [iters,root]=vimalkum_hw1_p1(@(x)(sin(x)),2,10);

% If the limit contains multiple roots, will the code find all the roots?

% No, This code works on bisection method, initially the limit range is
% broken in 2 equal ranges, and checks if there is a sign flip in the first
% half, if there is a sign flip, then the code continues to search only in
% the first half of the limit. Whereas there can be sign flip within in the
% second range, where the code will never search for the roots. 

% So, this code will return only one root. However, we can modify this code
% to search for the entire range of the limit, which is not the scope of
% this assignment.