function [newpop]=selection(pop, fitvalue)
%��������
[px,py] = size(pop);    %ȡ��pop�ľ�����
totalfit = sum(fitvalue);   
p_fitvalue = fitvalue/totalfit;     %����ÿ������ĸ���
p_fitvalue = cumsum(p_fitvalue);    %�����������

ms = sort(rand(px,1)); %��С��������
fitin = 1;
newin = 1;

%���һ�����ʣ����ж���������һ�����䣬��ȡ�Ǹ���������Ӧ�ĸ���
while newin<=px 
    if (ms(newin)) <p_fitvalue(fitin)
        newpop(newin,:) = pop(fitin, :);
        newin = newin + 1;
    else
        fitin = fitin + 1;
    end
end

        

