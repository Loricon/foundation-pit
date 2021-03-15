function [x2,y2,z2]=calculate_po(pt1,pt2,h,b)

test=pt2-pt1;
theta=90;
trans1=[cosd(theta) -sind(theta);
    sind(theta) cosd(theta)];

te=[test(1) test(2)]';
ye=te/norm(te)*b;
test=trans1*ye;
po=test+pt1;
po2=test+pt2;


x2=[pt1(1);pt2(1);po2(1);po(1)];
y2=[pt1(2);pt2(2);po2(2);po(2)];
z2=[h;h;0;0];



% test=pt2-pt1;
% ox=pt2(1);
% oy=pt2(2);
% theta=90;
% trans1=[cosd(theta) -sind(theta) ox;
%     sind(theta) cosd(theta) oy;
%     0 0 1];
% 
% te=[test(1) test(2)]';
% ye=te/norm(te)*b;
% to=[ye;1];
% po=trans1*to;
% 
% test2=-test;
% ox2=pt1(1);
% oy2=pt1(2);
% theta=-90;
% trans2=[cosd(theta) -sind(theta) ox2;
%     sind(theta) cosd(theta) oy2;
%     0 0 1];
% te2=[test2(1) test2(2)]';
% ye=te2/norm(te2)*b;
% to2=[ye;1];
% po2=trans2*to2;
% 
% 
% x2=[pt1(1);pt2(1);po(1);po2(1)];
% y2=[pt1(2);pt2(2);po(2);po2(2)];
% z2=[h;h;0;0];









