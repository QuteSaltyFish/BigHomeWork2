function pop = initpop(popsize, chromlength)
%通过rand函数生成0到1之间的浮点数
%再通过round四舍五入生成只有0，1构成的矩阵
pop = round (rand(popsize, chromlength));   