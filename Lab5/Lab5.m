%% Q1
n = 0:10;
h_n = (1./(pi.*(n-5))).*(sin(pi.*(n-5)./5)-sin(pi.*(n-5)./7));
h_n(6) = 2/35;
disp(h_n);
figure();
stem(n,h_n);
title('h[n]');
xlabel('n');

figure();
zplane(h_n);
title('Zeros and Poles of H(z)');

w = -pi:0.001:pi;
H_abs = abs(sum(h_n.'.*exp(n.'.*(-1j).*w)));
figure();
plot(w,H_abs);
axis tight
title('|H(e^j^w)|');
xlabel('w');

%% Q2
alpha = 50;
ts_param = 512;
rng = 1023;
limit = 1023;
n = 0:rng;
xf_n = chirp(limit, alpha, ts_param, rng);
figure();
plot(n,xf_n);
title('xf[n]');
xlabel('n');

%% Q3
alpha = 1000;
ts_param = 8192;
rng = 8191;
limit = 9000;
n = 0:rng;
xg_n = chirp(limit, alpha, ts_param, rng);
figure();
plot(n,xg_n);
title('xg[n]');
xlabel('x');

%% Q4 
% h_n
n = 0:10;
h_n = (1./(pi.*(n-5))).*(sin(pi.*(n-5)./5)-sin(pi.*(n-5)./7));
h_n(6) = 2/35;
y1_n = conv(xf_n, h_n);
figure();
plot(0:length(y1_n)-1,y1_n);
title('y1[n]');
xlabel('n');
axis tight

y2_n = conv(xg_n, h_n);
figure();
plot(0:length(y2_n)-1,y2_n);
title('y2[n]');
xlabel('n');
axis tight
%% save
save('y1_n');


%% Functions
 function out = speaker(data, alpha, param)
     sample_time = sqrt(pi./(param.*alpha));
     sample_freq = 1./sample_time;
     sound(data, sample_freq);
 end

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