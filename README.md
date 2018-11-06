# Goal-Programming

Using Matlab I computed the expected return, variance and covariance matrix for the data given. (The code is attached).
Stock	                   S1	     S2	      S3	     S4	    S5	    S6
Average(Expected Value)	0.5920	0.1760	0.3960	0.3900	0.1900	0.5540
Variance	              0.1999	0.0024	0.0063	0.0080	0.0055	0.0073

Covariance
 	     S1	     S2	    S3	   S4	      S5	   S6
S1	0.1999	0.0179	0.0200	 0.0192	-0.0261	 0.0336
S2	0.0179	0.0024	0.0018	 0.0021	-0.0032	 0.0041
S3	0.0200	0.0018	0.0063	 0.0037	-0.0048	 0.0030
S4	0.0192	0.0021	0.0037	 0.0080	-0.0033	 0.0031
S5	-0.0261	-0.0032	-0.0048	-0.0033	 0.0055	-0.0055
S6	0.0336	0.0041	0.0030	 0.0031	-0.0055	 0.0073

Question 2
Goal programming in terms of portfolio selection is an analytical approach devised to address financial decision-making problems where goals have been assigned to the attributes of a portfolio and where the decision maker is interested in minimizing the non-achievement of the corresponding goals.
The weighted goal programming (WGP) for portfolio model usually lists the unwanted deviational variables, each weighted according to their importance and minimizes the sum of the unwanted weighted deviations. In this project, the objective function in WGP model for portfolio selection seeks to minimize risk and maximize return by penalizing shortfalls in return\ (D_1^-) and excess risk ( D_2^+), relative to the respective goals. Therefore, lower levels of risk and higher levels of return are not penalized (D_1^+ and\ D_2^-). In this regard I set the” EqualityGoalCount” to 0 thus making the objectives lesser (in the case of variance) or more (the case of expected return) than the goals. And also to ensure that the same percentage of under or over-attainment in the active objectives at the solution, I set the weighting matrix to “abs (goal)”.
The mathematical structure of this problem is written as follows
                         MIN D_1^- + D_2^+
            Subject to 
                     F_{ER}-D_1^+ + D_1^-=0.47(F_{ER}\ is expected return function)
                     F_V-D_2^+ + D_2^-=0.0025 (F_V is the variance function)
                     D_1^+,D_1^-,\ D_2^-,D_2^+\geq 0
                     \sum_{i=1}^{6}\propto_i=0
                     0\le \propto_i\ \le1
