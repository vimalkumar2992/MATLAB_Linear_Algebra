% least square understanding

X = [0 1 2 3 4 5 6];
Y = [-0.02 1.1 5.0 8.5 17.3 26.1 42];

% Dependent variable
D = Y';
[m,n]=size(X);

% Building the dataset with first order polynomial, adding another column for intercept
A = ones(n,2);
A(:,2)=X';
X_approx = (A'*A)\(A'*D);
pred=A*X_approx;
error_1=sum((pred-D).^2);
eq_1=sprintf('y = %f + %fx', X_approx(1), X_approx(2));

scatter(X,Y);
hold on
plot(X, pred);
xlabel('X');
ylabel('Y/Pred');
hold on


% Building the dataset with second order polynomial, adding another column for intercept
A = ones(n,3);
A(:,2)=X';
A(:,3)=X'.^2;
X_approx = (A'*A)\(A'*D);
pred=A*X_approx;
error_2=sum((pred-D).^2);
eq_2=sprintf('y = %f + %fx + %fx^2', X_approx(1), X_approx(2), X_approx(3));


plot(X,pred);
legend('Raw Data',eq_1,eq_2)



