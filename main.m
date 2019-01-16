%初始化
clear;
clc;

popsize = 100;  %定义种群的数量
chromlength = 90;    %根据问题定义染色体的节点数，由于该题目有90个温度点，
                     %于是我们定义90个节点，每一个点若是0则代表不取这个数据点

pc = 0.6;   %定义发生交叉操作的可能性
pm = 0.001;     %定义发生变异的可能性

pop = initpop(popsize, chromlength);    %随机初始化种群
Bestindividual = zeros(100,90);     %存储每一代的最优取法
BestFit = zeros (1,100);    %存储每一代的最优值
for i = 1:100   %繁衍多少代
    %计算适应度
    objvalue = cal_objvalue(pop);
    fitvalue =objvalue;     
    %选择操作
    newpop = selection(pop, fitvalue);
    %交叉操作
    newpop =  crossover(newpop,pc);
    %变异操作
    newpop = mutation(newpop,pm);
    %更新种群
    pop = newpop;
    [genebestindividual, genebestfit] = best(pop,fitvalue);     %计算每一代最佳选法和最佳适应度的值
    Bestindividual(i,:)= genebestindividual;
    BestFit(1,i) = genebestfit;
end

[BestChoice, BestValue] = best(Bestindividual, BestFit);
%输出最佳选法和最佳适应度的值
fprintf('the best way is:');
disp(BestChoice);
fprintf('\nthe value is: %d', BestFit);
    
    