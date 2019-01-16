function [objvalue] = cal_objvalue(pop)
%读取原始数据
data = csvread('data.csv');    %原始数据
%生成一个空的矩阵，用于存储插值法
caldata = zeros(500,90);
objvalue = zeros(1,100);
for i=1:100  %每一个个体
    x=0;
    minustime = 0;
    data2 = csvread('data.csv');    %将要要去掉某些数据点点的数据  

    for j=1:90  %去掉不考虑的列
       if (pop(i,j)==0)  
           data2(:,j-minustime)=[];
           minustime = minustime +1;
       end
    end
    
    for j=1:500 %对每一个小系统差值
       
        caldata(j,:) = spline(data2(2*j,:), data2(1,:), data(2*j,:));
     
        %对于每一个小系统进行计算，x代表Ci只和
        for k=1:90
            %计算nQi
            if (pop(i,k)==1) 
                x = x + 50; %每一个所用的数据点的Q*Ni
            end
            C=abs(caldata(j,k)-data(1,k));
            %计算Si
            if ((1.0>=C) && (C > 0.5))
                x = x + 1;
            else if ((C>1.0) && (C<=1.5))
                    x = x + 5;
                else if ((C>1.5) && (C<=2))
                        x = x + 10;
                    else if ((C>2))
                            x = x + 10000;
                        end
                    end
                end
            end
        end
    end
    objvalue(1,i) = x/500;     %此处的objvalue代表的是C（方案成本）    
end

        
