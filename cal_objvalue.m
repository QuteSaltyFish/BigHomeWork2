function [objvalue] = cal_objvalue(pop)
%��ȡԭʼ����
data = csvread('data.csv');    %ԭʼ����
%����һ���յľ������ڴ洢��ֵ��
caldata = zeros(500,90);
objvalue = zeros(1,100);
for i=1:100  %ÿһ������
    x=0;
    minustime = 0;
    data2 = csvread('data.csv');    %��ҪҪȥ��ĳЩ���ݵ�������  

    for j=1:90  %ȥ�������ǵ���
       if (pop(i,j)==0)  
           data2(:,j-minustime)=[];
           minustime = minustime +1;
       end
    end
    
    for j=1:500 %��ÿһ��Сϵͳ��ֵ
       
        caldata(j,:) = spline(data2(2*j,:), data2(1,:), data(2*j,:));
     
        %����ÿһ��Сϵͳ���м��㣬x����Ciֻ��
        for k=1:90
            %����nQi
            if (pop(i,k)==1) 
                x = x + 50; %ÿһ�����õ����ݵ��Q*Ni
            end
            C=abs(caldata(j,k)-data(1,k));
            %����Si
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
    objvalue(1,i) = x/500;     %�˴���objvalue�������C�������ɱ���    
end

        
