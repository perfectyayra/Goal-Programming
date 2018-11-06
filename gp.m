Data=[0.10 0.12 0.30 0.40 0.30 0.45
      0.11 0.15 0.40 0.30 0.20 0.50
      0.9  0.17 0.50 0.45 0.15 0.55
      0.86 0.19 0.34 0.30 0.20 0.60
      0.99 0.25 0.44 0.50 0.10 0.67];
ER=mean(Data);%Expected Return of each stock
ER 
Var=var(Data); %Variance of each stock
Var
CovM=cov(Data); %Covariance Matrix
CovM
portopt(ER, CovM,20);
A=ER; %Expected Return Matrix constraint
b=12;
Aeq=ones(1,6);%Sum of weights matrix
beq=1; 
lb=zeros(1,6);%lower bound for each stock
ub=ones(1,6); %upper bound for each stock
goal=[-0.47 0.0025];%desired outcome
weight=abs(goal);%level of importance attached to the goals


%GOAL PROGRAMMING;
g = @(w) [
    -ER*transpose(w), 1/2*w*CovM*transpose(w)
    ];

options=optimoptions('fgoalattain', 'EqualityGoalCount', 0,'Display','iter');
[w,fval,attainfactor,exitflag]=fgoalattain(g,[0 0 0 0 0 1], goal,weight,[],[], Aeq, beq, lb, ub,[], options);
w
fval
attainfactor



%MINIMUM VARIANCE
options = optimoptions('quadprog', 'Algorithm','interior-point-convex','Display','iter');
[weightsP,sigmaP] = quadprog(CovM,[],A,b,Aeq,beq,lb,ub,[],options);

PortfolioReturn=ER*weightsP;
sigmaP
weightsP
PortfolioReturn


