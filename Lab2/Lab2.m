choice = input('Enter question number:');
% 1st number for question number and 2nd number for the part of the
% question. Ex: 13 responds to question 1 part c.
if choice == 11
a_1 = convolve(@res1,@inp1,10);
figure()
stem([0:29], a_1(41:70));
xlabel('n');
ylabel('y1[n]');
grid on
axis tight
title('y1[n] vs n');
disp(a_1(41:70));

elseif choice == 12
b_1 = convolve(@res1,@inp2,16);
figure()
stem([0:29],b_1(41:70));
xlabel('n');
ylabel('y2[n]');
grid on
axis tight
title('y2[n] vs n');
disp(b_1(41:70));

elseif choice == 13
c_1_Re = convolve(@res1,@inp3Re,16);
c_1_Im = convolve(@res1,@inp3Im,16);
figure()
subplot(2,1,1);
stem([0:29],c_1_Re(41:70));
xlabel('n');
ylabel('Re(y3[n])');
grid on
axis tight
title('Re(y3[n]) vs n');
subplot(2,1,2);
stem([0:29],c_1_Im(41:70),'r');
xlabel('n');
ylabel('Im(y3[n])');
grid on
axis tight
title('Im(y3[n]) vs n');
disp(c_1_Re(41:70));
disp(c_1_Im(41:70));

elseif choice == 14
d_1 = convolve(@res1,@inp4,16);
figure()
stem([0:29],d_1(41:70));
xlabel('n');
ylabel('y4[n]');
grid on
axis tight
title('y4[n] vs n');
disp(d_1(41:70));

elseif choice == 15
e_1 = convolve(@res1,@inp5,16);
figure()
stem([0:29],e_1(41:70));
xlabel('n');
ylabel('y5[n]');
grid on
axis tight
title('y5[n] vs n');
disp(e_1(41:70));

elseif choice == 16
f_1_Re = convolve(@res1,@inp6Re,16);
f_1_Im = convolve(@res1,@inp6Im,16);
figure()
subplot(2,1,1);
stem([0:29],f_1_Re(41:70));
xlabel('n');
ylabel('Re(y6[n])');
grid on
axis tight
title('Re(y6[n]) vs n');
subplot(2,1,2);
stem([0:29],f_1_Im(41:70),'r');
xlabel('n');
ylabel('Im(y6[n])');
grid on
axis tight
title('Im(y6[n]) vs n');
disp(f_1_Re(41:70));
disp(f_1_Im(41:70));

elseif choice == 21
a_2 = convolve(@res2,@inp1,10);
figure()
stem([0:29],a_2(41:70));
xlabel('n');
ylabel('y''1[n]');
grid on
axis tight
title('y''1[n] vs n');
disp(a_2(41:70));
elseif choice == 22
b_2 = convolve(@res2,@inp2,16);
figure()
stem([0:29],b_2(41:70));
xlabel('n');
ylabel('y''2[n]');
grid on
axis tight
title('y''2[n] vs n');
disp(b_2(41:70));

elseif choice == 23
c_2_Re = convolve(@res2,@inp3Re,16);
c_2_Im = convolve(@res2,@inp3Im,16);
figure()
subplot(2,1,1);
stem([0:29],c_2_Re(41:70));
xlabel('n');
ylabel('Re(y3[n])');
grid on
axis tight
title('Re(y''3[n]) vs n');
subplot(2,1,2);
stem([0:29],c_1_Im(41:70),'r');
xlabel('n');
ylabel('Im(y''3[n])');
grid on
axis tight
title('Im(y3[n]) vs n');
disp(c_2_Im(41:70));
disp(c_2_Re(41:70));

elseif choice == 24
d_2 = convolve(@res2,@inp4,16);
figure()
stem([0:29],d_2(41:70));
xlabel('n');
ylabel('y''4[n]');
grid on
axis tight
title('y''4[n] vs n');
disp(d_2(41:70));
elseif choice == 25
e_2 = convolve(@res2,@inp5,16);
figure()
stem([0:29],e_2(41:70));
xlabel('n');
ylabel('y''5[n]');
grid on
axis tight
title('y5''[n] vs n');
disp(e_2(41:70));

elseif choice == 26
f_2_Re = convolve(@res2,@inp6Re,16);
f_2_Im = convolve(@res2,@inp6Im,16);
figure()
subplot(2,1,1);
stem([0:29],f_2_Re(41:70));
xlabel('n');
ylabel('Re(y''6[n])');
grid on
axis tight
title('Re(y''6[n]) vs n');
subplot(2,1,2);
stem([0:29],f_2_Im(41:70),'r');
xlabel('n');
ylabel('Im(y''6[n])');
grid on
axis tight
title('Im(y''6[n]) vs n');
disp(f_2_Re(41:70));
disp(f_2_Im(41:70));
end

function out = convolve(response,input_fcn,interval)
out = zeros(1,81);
for n=-40:40
    value_temp = zeros(1,33);
    for k = -1*(interval):interval
        value_temp(k+17) = input_fcn(k)* response(n-k);
    end
    out(n+41) = sum(value_temp);
end
end

function out_us = u_s(k)
if(k>=0)
    out_us = 1;
else
    out_us = 0;
end
end

function h1 = res1(k)
h1 = u_s(k-2).*(1/2).^k;
end
function h2 = res2(k)
h2 = u_s(k-2).*3.*(1/2)^k + u_s(k-7).*(1/2)^(k-5);
end

function x1 = inp1(k)
if(k>=0 && k<=10)
    x1 = -1;
else
    x1 = 0;
end
end
function x2 = inp2(k)
if(k>=0 && k<=5)
    x2 = -1;
elseif(k>=6 && k<=10)
    x2 = 1;
elseif(k>=11 && k<=16)
    x2 = 2;
else
    x2 = 0;
end
end
function x3 = inp3Re(k)
if(k>=4 && k<=16)
    x3 = cos(2*k/3);
else
    x3 = 0;
end
end
function x3 = inp3Im(k)
if(k>=4 && k<=16)
    x3 = sin(2*k/3);
else
    x3 = 0;
end
end

function x4 = inp4(k)
if(k>=4 && k<=16)
    x4 = sin(2*k/3);
else
    x4 = 0;
end
end

function x5 = inp5(k)
if(k>=4 && k<=16)
    x5 = cos(2*k/3);
else
    x5 = 0;
end
end

function x6 = inp6Re(k)
x6 = real(2.*inp1(k) -3i.*inp2(k));
end
function x6 = inp6Im(k)
x6 = imag(2.*inp1(k) -3i.*inp2(k));
end



