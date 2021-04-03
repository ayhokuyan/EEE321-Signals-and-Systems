%% Q1-A
x = -pi:0.002:pi;
figure();
plot(x,abs(sin(21*x/2)./(21.*sin(x/2))),'m-.');
xlabel('w(rd)');
title('|H(e^j^w)|');
grid on
axis tight

figure();
plot(x,angle(sin(21*x/2)./(21.*sin(x/2))));
xlabel('w(rd)');
title('<H(e^j^w)');
axis tight
grid on
%% Q1-C
n = 0:255;
x1_out = x1(n);
figure();
stem(n,x1_out,'*','LineStyle',':');
hold on
stem(n,y1(@x1,n),'LineStyle',':');
xlabel('n');
legend('x[n]','y[n]');
title('Graph of x1[n] and y1[n]');
axis tight
grid on
hold off

x2_out = x2(n);
figure();
stem(n,x2_out,'*','LineStyle',':');
hold on
stem(n,y1(@x2,n),'LineStyle',':');
xlabel('n');
legend('x2[n]','y2[n]');
title('Graph of x2[n] and y2[n]')
axis tight
grid on
hold off

x3_out = x3(n);
figure();
stem(n,x3_out,'*','LineStyle',':');
hold on
stem(n,y1(@x3,n),'LineStyle',':');
xlabel('n');
legend('x3[n]','y3[n]');
title('Graph of x3[n] and y3[n]')
axis tight
grid on
hold off

x4_out = x4(n);
figure();
stem(n,x4_out,'*','LineStyle',':');
hold on
stem(n,y1(@x4,n),'LineStyle',':');
xlabel('n');
legend('x4[n]','y4[n]');
title('Graph of x4[n] and y4[n]')
axis tight
grid on

%% Q1-D
xtot_out = xtot(n);
figure();
stem(n,xtot_out,'*','LineStyle',':');
hold on
stem(n,y1(@xtot,n),'LineStyle',':');
xlabel('n');
legend('x[n]','y[n]');
title('Graph of x[n] and y[n]')
axis tight
grid on

%% Q2-A
x = -pi:0.002:pi;
figure();
plot(x,abs(4.*sin(x./2)),'b:');
xlabel('w(rd)');
title('H(e^j^w)');
grid on

axis tight
figure();
plot(x,angle(4.*sin(x./2).*(sin(x./2)+j.*cos(x./2))));
xlabel('w(rd)');
title('<H(e^j^w)');
axis tight
grid on

%% Q2-C
n = 0:255;
x1_out = x1(n);
figure();
stem(n,x1_out,'*','LineStyle',':');
hold on
stem(n,y2(@x1,n),'LineStyle',':');
xlabel('n');
legend('x[n]','y[n]');
title('Graph of x1[n] and y1[n]');
axis tight
grid on
hold off

x2_out = x2(n);
figure();
stem(n,x2_out,'*','LineStyle',':');
hold on
stem(n,y2(@x2,n),'LineStyle',':');
xlabel('n');
legend('x2[n]','y2[n]');
title('Graph of x2[n] and y2[n]')
axis tight
grid on
hold off

x3_out = x3(n);
figure();
stem(n,x3_out,'*','LineStyle',':');
hold on
stem(n,y2(@x3,n),'LineStyle',':');
xlabel('n');
legend('x3[n]','y3[n]');
title('Graph of x3[n] and y3[n]')
axis tight
grid on
hold off

x4_out = x4(n);
figure();
stem(n,x4_out,'*','LineStyle',':');
hold on
stem(n,y2(@x4,n),'LineStyle',':');
xlabel('n');
legend('x4[n]','y4[n]');
title('Graph of x4[n] and y4[n]')
axis tight
grid on

%% Q2-D
xtot_out = xtot(n);
figure();
stem(n,xtot_out,'*','LineStyle',':');
hold on
stem(n,y2(@xtot,n),'LineStyle',':');
xlabel('n');
legend('x[n]','y[n]');
title('Graph of x[n] and y[n]')
axis tight
grid on

%% Q3-A
x = -pi:0.002:pi;
figure();
plot(x,(cos(x) + (3/2)),'b:');
xlabel('w(rd)');
title('H(e^j^w)');
grid on

axis tight
figure();
plot(x,angle(cos(x) + (3/2)));
xlabel('w(rd)');
title('<H(e^j^w)');
axis tight
grid on

%% Q3-C
n = 0:255;
x1_out = x1(n);
figure();
stem(n,x1_out,'*','LineStyle',':');
hold on
stem(n,y3(@x1,n),'LineStyle',':');
xlabel('n');
legend('x[n]','y[n]');
title('Graph of x1[n] and y1[n]');
axis tight
grid on
hold off

x2_out = x2(n);
figure();
stem(n,x2_out,'*','LineStyle',':');
hold on
stem(n,y3(@x2,n),'LineStyle',':');
xlabel('n');
legend('x2[n]','y2[n]');
title('Graph of x2[n] and y2[n]')
axis tight
grid on
hold off

x3_out = x3(n);
figure();
stem(n,x3_out,'*','LineStyle',':');
hold on
stem(n,y3(@x3,n),'LineStyle',':');
xlabel('n');
legend('x3[n]','y3[n]');
title('Graph of x3[n] and y3[n]')
axis tight
grid on
hold off

x4_out = x4(n);
figure();
stem(n,x4_out,'*','LineStyle',':');
hold on
stem(n,y3(@x4,n),'LineStyle',':');
xlabel('n');
legend('x4[n]','y4[n]');
title('Graph of x4[n] and y4[n]')
axis tight
grid on

%% Q3-D
xtot_out = xtot(n);
figure();
stem(n,xtot_out,'*','LineStyle',':');
hold on
stem(n,y3(@xtot,n),'LineStyle',':');
xlabel('n');
legend('x[n]','y[n]');
title('Graph of x[n] and y[n]')
axis tight
grid on

%% Q4-A
x = -pi:0.002:pi;
figure();
plot(x,((3/2) - cos(x)),'b:');
xlabel('w(rd)');
title('H(e^j^w)');
grid on

axis tight
figure();
plot(x,angle((3/2) - cos(x)));
xlabel('w(rd)');
title('<H(e^j^w)');
axis tight
grid on

%% Q4-C
n = 0:255;
x1_out = x1(n);
figure();
stem(n,x1_out,'*','LineStyle',':');
hold on
stem(n,y4(@x1,n),'LineStyle',':');
xlabel('n');
legend('x[n]','y[n]');
title('Graph of x1[n] and y1[n]');
axis tight
grid on
hold off

x2_out = x2(n);
figure();
stem(n,x2_out,'*','LineStyle',':');
hold on
stem(n,y4(@x2,n),'LineStyle',':');
xlabel('n');
legend('x2[n]','y2[n]');
title('Graph of x2[n] and y2[n]')
axis tight
grid on
hold off

x3_out = x3(n);
figure();
stem(n,x3_out,'*','LineStyle',':');
hold on
stem(n,y4(@x3,n),'LineStyle',':');
xlabel('n');
legend('x3[n]','y3[n]');
title('Graph of x3[n] and y3[n]')
axis tight
grid on
hold off

x4_out = x4(n);
figure();
stem(n,x4_out,'*','LineStyle',':');
hold on
stem(n,y4(@x4,n),'LineStyle',':');
xlabel('n');
legend('x4[n]','y4[n]');
title('Graph of x4[n] and y4[n]')
axis tight
grid on

%% Q4-D
xtot_out = xtot(n);
figure();
stem(n,xtot_out,'*','LineStyle',':');
hold on
stem(n,y4(@xtot,n),'LineStyle',':');
xlabel('n');
legend('x[n]','y[n]');
title('Graph of x[n] and y[n]')
axis tight
grid on

%% Functions
function out = y1(x_i,n)
    x_i_fcn = @(u) x_i(u);
    out = 0;
    for k = -10:10
        out = out + (1/21).* x_i_fcn(n-k);
    end
end
function out = y2(x_i,n)
    x_i_fcn = @(u) x_i(u);
    out = 2*x_i_fcn(n) - 2*x_i_fcn(n-1);
end
function out = y3(x_i,n)
    x_i_fcn = @(u) x_i(u);
    out = 0.5*x_i_fcn(n+1) + 1.5*x_i_fcn(n) + 0.5*x_i_fcn(n-1);
end
function out = y4(x_i,n)
    x_i_fcn = @(u) x_i(u);
    out = -0.5*x_i_fcn(n+1) + 1.5*x_i_fcn(n) - 0.5*x_i_fcn(n-1);
end


function out = x1(n)
    out = 1 + 0.*n;
end
function out = x2(n)
    out = cos(pi*n./14 + (pi/4));
end
function out = x3(n)
    out = 3*cos(2*pi*n./11);
end
function out = x4(n)
    out = 10*cos(pi*n);
end
function out = xtot(n)
    out = 1 + cos(pi*n./14 + (pi/4)) + 3*cos(2*pi*n./11) + 10*cos(pi*n);
end