close all
clear
clc



% 基坑控制点
p1=[3;0];
p2=[13;3];
p3=[8;7];
p4=[2;9];
point={p1 p2 p3 p4};

% 基坑深度
h=1.2;
% 放坡系数
b=0.7;  %K=H/B  H为基坑深度，B为坡脚宽度

%单一坡面计算


for i=1:length(point)
    
    if i<length(point)
        [x2,y2,z2]=calculate_po(point{i},point{i+1},h,b);
        
        pomian1{1}=x2;
        pomian1{2}=y2;
        pomian1{3}=z2;
        potest{i}=pomian1;

    else
        [x2,y2,z2]=calculate_po(point{i},point{1},h,b);
        pomian1{1}=x2;
        pomian1{2}=y2;
        pomian1{3}=z2;
        potest{i}=pomian1;
    end
    
end
    
    
k=0;
for i=1:length(potest)
    
    if i<length(potest)    
        
        ax=[potest{i}{1}(3) potest{i}{2}(3)];
        bx=[potest{i}{1}(4) potest{i}{2}(4)];  
        
        cx=[potest{i+1}{1}(3) potest{i+1}{2}(3)];
        dx=[potest{i+1}{1}(4) potest{i+1}{2}(4)];  
        value=node(bx,ax,cx,dx);
        
        potest{i}{1}(3)=value(1);
        potest{i}{2}(3)=value(2);
        
        potest{i+1}{1}(4)=value(1);
        potest{i+1}{2}(4)=value(2);
        k=k+1;
        hx(k)=value(1);
        hy(k)=value(2);        
        hz(k)=0;         
    
    else
       
        ax=[potest{i}{1}(3) potest{i}{2}(3)];
        bx=[potest{i}{1}(4) potest{i}{2}(4)];  
        
        cx=[potest{1}{1}(3) potest{1}{2}(3)];
        dx=[potest{1}{1}(4) potest{1}{2}(4)];  
        value=node(ax,bx,cx,dx);
        
        potest{i}{1}(3)=value(1);
        potest{i}{2}(3)=value(2);
        
        potest{1}{1}(4)=value(1);
        potest{1}{2}(4)=value(2);
        k=k+1;
        hx(k)=value(1);
        hy(k)=value(2);         
        hz(k)=0;     
    end
    
end
    



figure(1)

for i=1:length(potest)

x22=potest{i}{1};
y22=potest{i}{2};
z22=potest{i}{3};

fill3(x22,y22,z22,[0.5 0.6 0.7])
axis equal
hold on

end

fill3(hx,hy,hz,[0.5 0.6 0.7])
hold on


plot3(ax(1),ax(2),0,'ko');
hold on
plot3(bx(1),bx(2),0,'ro');
hold on
plot3(cx(1),cx(2),0,'ko');
hold on
plot3(dx(1),dx(2),0,'ro');
hold on
plot3(value(1),value(2),0,'mo');
hold on



% figure(3)
% plot([ax(1) bx(1)],[ax(2) bx(2)],'k-');
% hold on
% plot(ax(1),ax(2),'ro');
% hold on
% plot([cx(1) dx(1)],[cx(2) dx(2)],'k-');
% hold on
% plot(cx(1),cx(2),'ko');
% hold on
% plot(value(1),value(2),'mo');
% hold on

     
        
  




