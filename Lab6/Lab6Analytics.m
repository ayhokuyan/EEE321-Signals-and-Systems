%% Q1
gain = 0.96;
gain2 = 1.01;
gain3 = 0.8;
zrs = [gain2*exp(1j*pi*(11/105)); gain2*exp(1j*pi*(-11/105)); gain2*exp(1j*pi*(39/105)); gain2*exp(1j*pi*(-39/105));...
      gain3*exp(1j*pi*(2));];
poles = [gain*exp(1j*pi*(31/105)); gain*exp(1j*pi*(27/105)); gain*exp(1j*pi*(23/105)); gain*exp(1j*pi*(19/105));...
         gain*exp(1j*pi*(-31/105)); gain*exp(1j*pi*(-27/105)); gain*exp(1j*pi*(-23/105)); gain*exp(1j*pi*(-19/105))];
figure();
zplane(zrs, poles);
title('Zero-Pole Plot')

[nom_coeff, denom_coeff] = zp2tf(zrs, poles,gain2/gain);

figure();
[imp_resp, time] = impz(nom_coeff,denom_coeff, -10:250);
impz(nom_coeff,denom_coeff, -10:100);
disp(imp_resp);

figure();
freqz(nom_coeff,denom_coeff,-pi:0.01:pi);

param = 8192;
alpha = 1000;
t_samp = sqrt(pi./(param.*alpha));
w = -pi:0.001:pi
hejw =(nom_coeff(4).*exp(-1j*w*0) + nom_coeff(5).*exp(-1j*w*1) + nom_coeff(6).*exp(-1j*w*2) + nom_coeff(7).*exp(-1j*w*3) + nom_coeff(8).*exp(-1j*w*4) + ...
      nom_coeff(9).*exp(-1j*w*5)) ./ ...
      (exp(-1j*w*0) +denom_coeff(2).*exp(-1j*w*1) + denom_coeff(3).*exp(-1j*w*2) + denom_coeff(4).*exp(-1j*w*3) + denom_coeff(5).*exp(-1j*w*4)...
      +denom_coeff(6).*exp(-1j*w*5) + denom_coeff(7).*exp(-1j*w*6) + denom_coeff(8).*exp(-1j*w*7) + denom_coeff(9).*exp(-1j*w*8));
figure();
plot(w,abs(hejw));
title('Frequency Response H(e^j^w)');
axis tight
xlabel('w (rad/unit time)')
%% Q2-3 -512
alpha = 50;
ts_param = 512;
rng = 1050;
limit = 1023;
n = 0:rng;
x1_n = chirp(limit, alpha, ts_param, rng);
figure();
plot(n,x1_n);
title('x1[n]');
xlabel('n');

y_1 = zeros(1,1050);
x1_n = [0 0 0 0 0 0 0 0 0 0 x1_n];
for i=-10:1040
    if(i>=0)
    y_1(i+11) = -denom_coeff(2)*y_1(i+10) - denom_coeff(3)*y_1(i+9) - denom_coeff(4)*y_1(i+8) - denom_coeff(5)*y_1(i+7)...
    -denom_coeff(6)*y_1(i+6) - denom_coeff(7)*y_1(i+5) - denom_coeff(8)*y_1(i+4) - denom_coeff(9)*y_1(i+3) + ...
    nom_coeff(4)*x1_n(i+11) + nom_coeff(5)*x1_n(i+10) + nom_coeff(6)*x1_n(i+9) + nom_coeff(7)*x1_n(i+8) + nom_coeff(8)*x1_n(i+7) + ...
    nom_coeff(9)*x1_n(i+6);
    else 
    y_1(i+11) = 0;
    end
end
figure()
plot(y_1);
xlabel('n (samples)');
title('Output y1[n] Found by Recursion');
axis tight
figure();
y = filter(nom_coeff, denom_coeff,x1_n);
plot(y);
xlabel('n (samples)');
title('Output y1[n] Found by Using filter() Function');
axis tight

%% Q2-3 8192
clear y_2
alpha = 50;
ts_param = 8192;
rng = 10000;
limit = 8192;
n = 0:rng;
x2_n = chirp(limit, alpha, ts_param, rng);
figure();
plot(n,x2_n);
title('x2[n]');
xlabel('n');

y_2 = zeros(1,10000);
x2_n = [0 0 0 0 0 0 0 0 0 0 x2_n];
for i=-10:9950
    if(i>=0)
    y_2(i+11) = -denom_coeff(2)*y_2(i+10) - denom_coeff(3)*y_2(i+9) - denom_coeff(4)*y_2(i+8) - denom_coeff(5)*y_2(i+7)...
    -denom_coeff(6)*y_2(i+6) - denom_coeff(7)*y_2(i+5) - denom_coeff(8)*y_2(i+4) - denom_coeff(9)*y_2(i+3) + ...
    nom_coeff(4)*x2_n(i+11) + nom_coeff(5)*x2_n(i+10) + nom_coeff(6)*x2_n(i+9) + nom_coeff(7)*x2_n(i+8) + nom_coeff(8)*x2_n(i+7)+...
    nom_coeff(9)*x2_n(i+6);
    else 
    y_2(i+11) = 0;
    end
end
figure()
plot(y_2);
xlabel('n (samples)');
title('Output y2[n] Found by Recursion');
axis tight
figure();
y_21 = filter(nom_coeff, denom_coeff,x2_n);
plot(y_21);
xlabel('n (samples)');
title('Output y2[n] Found by Using filter() Function');
axis tight

%% Q4
alpha = 1000;
param = 8192;
sample_time = sqrt(pi./(param.*alpha));
sample_freq = 1./sample_time;
player = audioplayer(x2_n, sample_freq);
period =  sample_time.*length(x2_n);
 while(1)
     play(player);
     pause(period-0.1);
     stop(player);
 end

 %% Q5
alpha = 1000;
param = 8192;
sample_time = sqrt(pi./(param.*alpha));
sample_freq = 1./sample_time;
player = audioplayer(y_2/10, sample_freq);
period =  sample_time.*length(y_2);
 while(1)
     play(player);
     pause(period-0.1);
     stop(player);
 end
 
%% Q6
param = 8192;
alpha = 1000;
t_samp = sqrt(pi./(param.*alpha));
w = -15000:1:15000
hjw =(nom_coeff(4).*exp(-1j*w*0*t_samp) + nom_coeff(5).*exp(-1j*w*1*t_samp) + nom_coeff(6).*exp(-1j*w*2*t_samp) + nom_coeff(7).*exp(-1j*w*3*t_samp) + nom_coeff(8).*exp(-1j*w*4*t_samp) + ...
      nom_coeff(9).*exp(-1j*w*5*t_samp)) ./ ...
      (exp(-1j*w*0*t_samp) +denom_coeff(2).*exp(-1j*w*1*t_samp) + denom_coeff(3).*exp(-1j*w*2*t_samp) + denom_coeff(4).*exp(-1j*w*3*t_samp) + denom_coeff(5).*exp(-1j*w*4*t_samp)...
      +denom_coeff(6).*exp(-1j*w*5*t_samp) + denom_coeff(7).*exp(-1j*w*6*t_samp) + denom_coeff(8).*exp(-1j*w*7*t_samp) + denom_coeff(9).*exp(-1j*w*8*t_samp));
hjw_final = hjw(floor(-pi/t_samp)+15000:floor(pi/t_samp)+15000);
figure();
plot(floor(-pi/t_samp):floor(pi/t_samp),abs(hjw_final));
title('Heq(jw)');
axis tight
xlabel('w(rad/s)');

%% Q7-i
[music frq] = audioread('Cem Adrian - Ayr?l?k.mp3');
cropped = music(1:1000000,[1,2]);
sound(cropped,frq);
figure();

plot(cropped(1:1:end));
 
%% Q7-ii
cropped_tr = cropped';

% filtr_msc_1 = filtfilt(nom_coeff, denom_coeff,cropped_tr(1,1:end));
crop1 = [0 0 0 0 0 0 0 0 0 0 cropped_tr(1,1:end)];
filtr_msc_1 = zeros(1,1000020);
for i=-10:999980
    if(i>=0)
    filtr_msc_1(i+11) = -denom_coeff(2)*filtr_msc_1(i+10) - denom_coeff(3)*filtr_msc_1(i+9) - denom_coeff(4)*filtr_msc_1(i+8) - denom_coeff(5)*filtr_msc_1(i+7)...
    -denom_coeff(6)*filtr_msc_1(i+6) - denom_coeff(7)*filtr_msc_1(i+5) - denom_coeff(8)*filtr_msc_1(i+4) - denom_coeff(9)*filtr_msc_1(i+3) + ...
    nom_coeff(4)*crop1(i+11) + nom_coeff(5)*crop1(i+10) + nom_coeff(6)*crop1(i+9) + nom_coeff(7)*crop1(i+8) + nom_coeff(8)*crop1(i+7)...
    +nom_coeff(9)*crop1(i+6);
    else 
    filtr_msc_1(i+11) = 0;
    end
end

% filtr_msc_2 = filtfilt(nom_coeff, denom_coeff,cropped_tr(2,1:end));
crop2 = [0 0 0 0 0 0 0 0 0 0 cropped_tr(2,1:end)];
filtr_msc_2 = zeros(1,1000020);
for i=-10:999980
    if(i>=0)
    filtr_msc_2(i+11) = -denom_coeff(2)*filtr_msc_2(i+10) - denom_coeff(3)*filtr_msc_2(i+9) - denom_coeff(4)*filtr_msc_2(i+8) - denom_coeff(5)*filtr_msc_2(i+7)...
    -denom_coeff(6)*filtr_msc_2(i+6) - denom_coeff(7)*filtr_msc_2(i+5) - denom_coeff(8)*filtr_msc_2(i+4) - denom_coeff(9)*filtr_msc_2(i+3) + ...
    nom_coeff(4)*crop2(i+11) + nom_coeff(5)*crop2(i+10) + nom_coeff(6)*crop2(i+9) + nom_coeff(7)*crop2(i+8) + nom_coeff(8)*crop2(i+7)...
    +nom_coeff(9)*crop2(i+6);
    else 
    filtr_msc_2(i+11) = 0;
    end
end
filtr_msc = [filtr_msc_1; filtr_msc_2];
sound(filtr_msc,frq);
figure();
plot(filtr_msc_1);
figure();
plot(filtr_msc_2);



%% Q8-i
[music frq] = audioread('Kay?t.m4a');
cropped = music(1:500000,[1,2]);
sound(cropped,frq);
figure();
plot(cropped(1:1:end));
 
%% Q8-ii
cropped_tr = cropped';

% filtr_msc_1 = filtfilt(nom_coeff, denom_coeff,cropped_tr(1,1:end));
crop1 = [0 0 0 0 0 0 0 0 0 0 cropped_tr(1,1:end)];
filtr_msc_1 = zeros(1,500010);
for i=-10:499980
    if(i>=0)
    filtr_msc_1(i+11) = -denom_coeff(2)*filtr_msc_1(i+10) - denom_coeff(3)*filtr_msc_1(i+9) - denom_coeff(4)*filtr_msc_1(i+8) - denom_coeff(5)*filtr_msc_1(i+7)...
    -denom_coeff(6)*filtr_msc_1(i+6) - denom_coeff(7)*filtr_msc_1(i+5) - denom_coeff(8)*filtr_msc_1(i+4) - denom_coeff(9)*filtr_msc_1(i+3) + ...
    nom_coeff(4)*crop1(i+11) + nom_coeff(5)*crop1(i+10) + nom_coeff(6)*crop1(i+9) + nom_coeff(7)*crop1(i+8) + nom_coeff(8)*crop1(i+7)...
    +nom_coeff(9)*crop1(i+6);
    else 
    filtr_msc_1(i+11) = 0;
    end
end

% filtr_msc_2 = filtfilt(nom_coeff, denom_coeff,cropped_tr(2,1:end));
crop2 = [0 0 0 0 0 0 0 0 0 0 cropped_tr(2,1:end)];
filtr_msc_2 = zeros(1,500010);
for i=-10:499980
    if(i>=0)
    filtr_msc_2(i+11) = -denom_coeff(2)*filtr_msc_2(i+10) - denom_coeff(3)*filtr_msc_2(i+9) - denom_coeff(4)*filtr_msc_2(i+8) - denom_coeff(5)*filtr_msc_2(i+7)...
    -denom_coeff(6)*filtr_msc_2(i+6) - denom_coeff(7)*filtr_msc_2(i+5) - denom_coeff(8)*filtr_msc_2(i+4) - denom_coeff(9)*filtr_msc_2(i+3) + ...
    nom_coeff(4)*crop2(i+11) + nom_coeff(5)*crop2(i+10) + nom_coeff(6)*crop2(i+9) + nom_coeff(7)*crop2(i+8) + nom_coeff(8)*crop2(i+7)...
    +nom_coeff(9)*crop2(i+6);
    else 
    filtr_msc_2(i+11) = 0;
    end
end
filtr_msc = [filtr_msc_1; filtr_msc_2];
sound(filtr_msc,frq);
figure();
plot(filtr_msc_1);
plot(filtr_msc_2);

%% Functions
function out = chirp(limit, alpha, param, rng)
sample_time = sqrt(pi./(param.*alpha));
out = zeros(1,rng+1);
for i = 1:rng+1    
    if(0 <= i-1 && i-1 <= limit)    
        out(i) = cos(alpha.*((i-1).*sample_time).^2);
    else
        out(i) = 0.*(i-1);
    end
end    
end