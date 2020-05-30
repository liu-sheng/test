out=[],i=1;
for theta=pi/10+0.02:pi/200:pi/2-0.2;
    size_t=50/0.01;
for x=0:0.1:10
    Q=0;
B=1e-10,V=0.95;A=1.02,F=2.05,mu=0.32;
 k=1e-3;
v0=7;
v1=sqrt((2*9.8*tan(theta)*x+v0*v0)*sin(theta)*sin(theta))
v2=sqrt((2*9.8*tan(theta)*x+v0*v0)*sin(theta)*cos(theta))
Q2=k*log(v2);
L=1;
L1=L/cos(theta)/size_t;
a=9.8*sin(theta)-mu*9.8*cos(theta);
v3=v1*v1+2*a*L1;
t=(v3-v1)/a;
% t=L/cos(theta)/size_t/v1
vt=v1;
erosion=0.02*(B^(-0.59)*10^(-7)*0.53*V^(vt)*F)/A;
Q1=real(erosion*t)
Q=Q+Q1+Q2;
end
out(i,2)=Q;
out(i,1)=theta;
out(i,3)=t;
out(i,4)=erosion;
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
figure(1)
xlabel({'The roof tilt Angle'});
title({'Amount of erosion under different rain velocities'});
% title({'The relationship between Angle and erosion'});
ylabel({'Erosion'});
S=50;
scatter(out(:,1),out(:,2),S,'filled')
hold on ;
plot(out(:,1), out(:,2), 'b');
