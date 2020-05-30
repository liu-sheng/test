

i=1;
out=[]
for theta=pi/10:pi/200:pi/2-0.15;
    size_t=50/0.01;
for x=0:0.1:10
    Q=0;
B=1e-10,V=1.04;A=0.25;
v0=1;
v1=sqrt((2*9.8*tan(theta)*x+v0*v0)*sin(theta)*sin(theta))
L=10;
t=L/cos(theta)/size_t/v1
vt=v1
erosion=0.02*(B^(-0.59)*10^(-7)*0.53*V^(vt)*F)/A
Q1=real(erosion*t)
Q=Q+Q1;
end
out(i,2)=Q;
out(i,1)=theta;
i=i+1;
end
out(:,1)=out(:,1)*180/pi;
min_Q = min(out(:,2))
len=length(out(:,1));
for i=1:len
    if out(i,2)<(min(out(:,2))*(1.002))
        best_angle=out(i,1);
    end
end
disp('The best Angle is:')
disp(best_angle);
% figure(1)
xlabel({'The roof tilt Angle'});
title({'Amount of erosion under different rain velocities'});
ylabel({'Erosion'});
S=50;
scatter(out(:,1),out(:,2),S,'filled')
hold on 
%   plot(out(:,1), out(:,2), 'b');

% sa=10-3;
% 
% out_k=[]
% j=1;
% for kkkk=0.2:0.1:100
%     
%     if r<-3
%     sa=1/r;
%     
%     else
%         sa=r;
%      end
%         
%     
% temp=(1+sa/(kkkk*9.8*30*cos(pi/7)))
% k=tan(pi/6)*1/temp;
% out_k(j,1)=k;
% out_k(j,2)=kkkk;
% out_k(j,3)=temp;
% j=j+1;
% end
% 
% 
x=[0:0.01:1];
k=1;
for x=0.7:0.0001:1
    
y=(1+2.5*x+6.25*x*x)*(1+2.5*(1-x));


out_y(k,1)=x;
out_y(k,2)=y;

k=k+1;
end
min_l = min(out_y(:,2))
len=length(out_y(:,1));
for i=1:len
    if out_y(i,2)<(max(out_y(:,1))*(0.999))
        max_y=out_y(i,2);
        max_x=out_y(i,1);
    end
end
% plot(out_y(:,1), out_y(:,2), 'b');
plot(out_y(:,1), out_y(:,2),'r','linewidth',2)
text(max_x,max_y,'o','color','g')
k=1
for x=0:0.01:1
    
y=-0.00009*x*x-0.2239*cos(x)+0.08885*x+0.000*exp(x)+0.7937


out_theta(k,1)=x;
out_theta(k,2)=y;

k=k+1;
end
 plot(out_theta(:,1), out_theta(:,2), 'b');

 k=1
 out_h=[];
 for R=0:0.1:500;
 J=1.8663;
 a=100^1e-9,E=30,g=70*1e9,rho=2.6;
 G=0.054*a^(-1/3)*E^(2/3)*g^(1/3)
 temp=(9*J*G*R*R)/(16*rho*9.8)
 h=temp^(1/3);
%  disp(h);
 out_h(k,1)=R;
 out_h(k,2)=h;
 k=k+1;
 end
  plot(out_h(:,1), out_h(:,2), 'b');
 

% R=0.02*(B^(-0.59)*10^(-7)*0.53*V^(1.73)*F)/A
