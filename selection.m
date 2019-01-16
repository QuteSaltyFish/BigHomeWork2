function [newpop]=selection(pop, fitvalue)
%构造轮盘
[px,py] = size(pop);    %取得pop的矩阵规格
totalfit = sum(fitvalue);   
p_fitvalue = fitvalue/totalfit;     %计算每个个体的概率
p_fitvalue = cumsum(p_fitvalue);    %概率求和排序

ms = sort(rand(px,1)); %从小到大排列
fitin = 1;
newin = 1;

%随机一个概率，并判断它落在哪一个区间，并取那个区间所对应的个体
while newin<=px 
    if (ms(newin)) <p_fitvalue(fitin)
        newpop(newin,:) = pop(fitin, :);
        newin = newin + 1;
    else
        fitin = fitin + 1;
    end
end

        

