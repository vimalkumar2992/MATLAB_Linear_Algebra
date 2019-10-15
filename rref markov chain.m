% Q 1.a
% Writing the Augmented matrix into an Array
A = [2 4 1 6 7; -2 0 2 1 12; -2 6 2 1 0;-8 -2 1 1 -11];

% Creating Row Reduced Echelon Form with rref function
R = rref(A);

% The echelon form is shown here
% R =
% 
%      1     0     0     0     3
%      0     1     0     0    -2
%      0     0     1     0     9
%      0     0     0     1     0

% As we see that the matrix doesn't reduce to 'Reduced Echelon form'
% There is one unique solution 

% x0 =  3
% x1 = -2 
% x2 =  9
% x3 =  0


% Q 1.b
% Writing the Augmented matrix into an Array
B = [2 4 1 6 7; -2 0 2 1 12; -2 6 2 1 0;14 -14 -11 0 -29];
R = rref(B);

% R =
% % 
%     1.0000         0         0    1.8333    3.0000
%          0    1.0000         0         0   -2.0000
%          0         0    1.0000    2.3333    9.0000
%          0         0         0         0         0

% There is a row full of zero, which means there are infinitely many
% solutions 

%Let's solve for 1 solution 
% x0 + 1.8333x3 = 3
% x1 = -2
% x2 + 2.3333x3 = 9

% x3 being a free variable lets assume x3=1

% x0 + 1.8333 = 3 so, x0= 1.1667
% x2 + 2.3333 = 9 so, x2= 7.6667

% one solution can be as follows
% x0 = 1.1667
% x1 = -2
% x2 = 7.6667
% x3 = 1


% Q 1.c
% Writing the Augmented matrix into an Array
C = [2 4 1 6 7; -2 0 2 1 12; -2 6 2 1 0;14 -14 -11 0 0];
R = rref(C);

% R =
% 
%     1.0000         0         0    1.8333         0
%          0    1.0000         0         0         0
%          0         0    1.0000    2.3333         0
%          0         0         0         0    1.0000


% This reduced row echelon form shows that there are no solutions for this
% problem



% 5.a 
M=[1/4 1/3; 3/4 2/3];
P=[2/3; 1/3];

P1 = M * P;
P2 = M * P1;

% The probability vector P1 (after one transformation) 
% P1 =
% 
%     0.2778
%     0.7222


% The probability vector P2 (after two transformation) 
% P2 =
% 
%     0.3102
%     0.6898

% 5.b 
M_b=[1/2 1/3 0; 0 2/3 1/2; 1/2 0 1/2];
P_b=[1/3; 1/6; 1/2];


P1_b = M_b * P_b;
P2_b = M_b * P1_b;

% The probability vector P1 (after one transformation) 
% P1_b =
% 
%     0.2222
%     0.3611
%     0.4167

% The probability vector P2 (after two transformation) 
% P2_b =
% 
%     0.2315
%     0.4491
%     0.3194

% 5.c
M_c=[1/4 1/3 1/2; 1/2 1/3 1/6; 1/4 1/3 1/3];
P_c=[1/4;1/2;1/4];

P1_c = M_c * P_c;
P2_c = M_c * P1_c;


% The probability vector P1 (after one transformation) 
% P1_c =
% 
%     0.3542
%     0.3333
%     0.3125


% The probability vector P2 (after two transformation) 
% P2_c =
% 
%     0.3559
%     0.3403
%     0.3038


% Q 6

% the transformation amongst the different parties and non-voting group is
% below

M=[0.7 0.2 0.2 0.1; 0.1 0.6 0.1 0.1; 0.1 0.2 0.6 0.1; 0.1 0 0.1 0.7];

% The current standing as per the previous election is given below 
P=[0.3; 0.15; 0.45; 0.1];

% what would happen after one year? 
% Let's perform one markov transformation 

P1 = M * P;
% % 
% P1 =
% 
%     0.3400
%     0.1750
%     0.3400
%     0.1450

% Inference:
% Party A gets 34% 
% Party B gets 17.5%
% Party C gets 34% 
% No voting 14.5% 

% The above is the percentage of citizens voting to a party or non-voting

% What would happen another year after that?
% another markov's transformation

P2 = M * P1;
% P2 =
% P2 =
% 
%     0.3555
%     0.1875
%     0.2875
%     0.1695


% Inference:
% Party A gets 35.55% 
% Party B gets 18.75%
% Party C gets 28.75% 
% No voting 16.95% 

% The above is the percentage of citizens voting to a party or non-voting

% What happens in 100 years from now?
% Lets perform 100 markov's transformations

M=[0.7 0.2 0.2 0.1; 0.1 0.6 0.1 0.1; 0.1 0.2 0.6 0.1; 0.1 0 0.1 0.7];
P=[0.3; 0.15; 0.45; 0.1];

M_trans=M*M;

for i = 1:99
    M_trans=M_trans*M
end


P100=M_trans*P;
% 
% P100 =
% 
%     0.3600
%     0.2000
%     0.2400
%     0.2000

% Inference: 
% After 100 years, Party A seems to get 36% of the votes
% Party C gets 24% of the votes

% The system seems to stabilize after a period of time, such that further
% transformations doesn't change this distribution
