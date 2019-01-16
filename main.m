%��ʼ��
clear;
clc;

popsize = 100;  %������Ⱥ������
chromlength = 90;    %�������ⶨ��Ⱦɫ��Ľڵ��������ڸ���Ŀ��90���¶ȵ㣬
                     %�������Ƕ���90���ڵ㣬ÿһ��������0�����ȡ������ݵ�

pc = 0.6;   %���巢����������Ŀ�����
pm = 0.001;     %���巢������Ŀ�����

pop = initpop(popsize, chromlength);    %�����ʼ����Ⱥ
Bestindividual = zeros(100,90);     %�洢ÿһ��������ȡ��
BestFit = zeros (1,100);    %�洢ÿһ��������ֵ
for i = 1:100   %���ܶ��ٴ�
    %������Ӧ��
    objvalue = cal_objvalue(pop);
    fitvalue =objvalue;     
    %ѡ�����
    newpop = selection(pop, fitvalue);
    %�������
    newpop =  crossover(newpop,pc);
    %�������
    newpop = mutation(newpop,pm);
    %������Ⱥ
    pop = newpop;
    [genebestindividual, genebestfit] = best(pop,fitvalue);     %����ÿһ�����ѡ���������Ӧ�ȵ�ֵ
    Bestindividual(i,:)= genebestindividual;
    BestFit(1,i) = genebestfit;
end

[BestChoice, BestValue] = best(Bestindividual, BestFit);
%������ѡ���������Ӧ�ȵ�ֵ
fprintf('the best way is:');
disp(BestChoice);
fprintf('\nthe value is: %d', BestFit);
    
    