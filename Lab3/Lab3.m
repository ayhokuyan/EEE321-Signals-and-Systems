%% Q1
% Part A 
% Defining parameters for discrete function y_n
prd = 12;
t_s = 0.2;
n = -40:215;
nt_s = t_s .* n;
% Define anonymous periodic function y_t
y_t = @(nt_s) 0.*(0<=mod(nt_s,prd) & mod(nt_s,prd)<4)...
             + 5.*(4<=mod(nt_s,prd) & mod(nt_s,prd)<6)...
             + 0.*(6<=mod(nt_s,prd) & mod(nt_s,prd)<12);
% Discretizing 
y_n = y_t(nt_s);
% Plot a section of y_n
plot(n,y_n,'r');
axis tight
title('Graph of y[n]');
ylabel('y[n]');
xlabel('n');

% Part D
% Finding and plotting the ak weights of the expansion
%figure();
k_lim = 70;
a_k1_array = a_k1(k_lim);
disp(a_k1_array);
%stem(-k_lim:k_lim, a_k1_array);
% Approximating and plotting the FSE
figure();
plot(n, fourier_ser(nt_s,prd,a_k1_array, k_lim));
title('FSE for y approximating from -70 to 70');
xlabel('n');
ylabel('y[n]');
axis tight

% Part I
% Plot the harmonics
figure();
plot(nt_s, kth_harmonic(nt_s, 0, a_k1_array, prd, k_lim),'b');
hold on
plot(nt_s, kth_harmonic(nt_s, 1, a_k1_array, prd, k_lim),'r');
hold on
plot(nt_s, kth_harmonic(nt_s, 2, a_k1_array, prd, k_lim),'k');
hold on
plot(nt_s, kth_harmonic(nt_s, 3, a_k1_array, prd, k_lim),'m');
title('0th, 1st, 2nd and 3rd Harmonics of y(t)');
xlabel('t');
axis tight
grid on
legend('0th Harmonic','1st Harmonic','2nd Harmonic','3rd Harmonic');
hold off

% Part E,F,G,H
for r = [25, 7, 3, 1]
    %figure();
    k_lim = r;
    a_k1_array = a_k1(k_lim);
    %stem(-k_lim:k_lim, a_k1_array);
    figure();
    plot(n, fourier_ser(nt_s,prd,a_k1_array, k_lim));
    title(['FSE for y approximating from -', num2str(r), ' to ', num2str(r)]);
    xlabel('n');
    ylabel('y[n]');
    axis tight
    
end

%% Q2
% Part A 
% Defining parameters for discrete function y_n
prd = 6;
t_s = 0.2;
n = -40:215;
nt_s = t_s .* n;
% Define anonymous periodic function y_t
y_t = @(nt_s) abs(4*cos(pi*nt_s/6));
y_n = y_t(nt_s);
% Plot a section of y_n
figure();
plot(n,y_n,'r');
title('Graph of y[n]');
ylabel('y[n]');
xlabel('n');
axis tight

% Part D
% Finding and plotting the ak weights of the expansion
%figure();
k_lim = 70;
a_k2_array = a_k2(k_lim);
disp(a_k2_array);
%stem(-k_lim:k_lim, a_k2_array);
% Approximating and plotting the FSE
figure();
plot(n, fourier_ser(nt_s,prd,a_k2_array, k_lim));
title('FSE for y approximating from -70 to 70');
xlabel('n');
ylabel('y[n]');
axis tight

% Part I
% Plot the harmonics
figure();
plot(nt_s, kth_harmonic(nt_s, 0, a_k2_array, prd, k_lim),'b');
hold on
plot(nt_s, kth_harmonic(nt_s, 1, a_k2_array, prd, k_lim),'r');
hold on
plot(nt_s, kth_harmonic(nt_s, 2, a_k2_array, prd, k_lim),'k');
hold on
plot(nt_s, kth_harmonic(nt_s, 3, a_k2_array, prd, k_lim),'m');
title('0th, 1st, 2nd and 3rd Harmonics of y(t)');
xlabel('t');
axis tight
grid on
legend('0th Harmonic','1st Harmonic','2nd Harmonic','3rd Harmonic');
hold off

% Part E,F,G,H
for r = [25, 7, 3, 1]
    %figure();
    k_lim = r;
    a_k2_array = a_k2(k_lim);
    %stem(-k_lim:k_lim, a_k2_array);
    figure();
    plot(n, fourier_ser(nt_s,prd,a_k2_array, k_lim));
    title(['FSE for y approximating from -', num2str(r), ' to ', num2str(r)]);
    xlabel('n');
    axis tight
    ylabel('y[n]');
    
end

%% Q3
% Part A 
% Defining parameters for discrete function y_n
prd = 12;
t_s = 0.2;
n = -40:215;
nt_s = t_s .* n;
% Define anonymous periodic function y_t
y_t = @(nt_s) abs(4*cos(pi*nt_s/6)).*(0<=mod(nt_s,prd) & mod(nt_s,prd)<3)...
             + abs(4*cos(pi*nt_s/6)).*(9<=mod(nt_s,prd) & mod(nt_s,prd)<12)...
             + 0.*(3<=mod(nt_s,prd) & mod(nt_s,prd)<9);
% Discretizing 
y_n = y_t(nt_s);
% Plot a section of y_n
figure()
plot(n,y_n,'r');
ylabel('y[n]');
xlabel('n');
title('Graph of y[n]');
axis tight

% Part D
% Finding and plotting the ak weights of the expansion
%figure();
k_lim = 70;
a_k3_array = a_k3(k_lim);
disp(a_k3_array);
%stem(-k_lim:k_lim, a_k3_array);
% Approximating and plotting the FSE
figure();
plot(n, fourier_ser(nt_s,prd,a_k3_array, k_lim));
title('FSE for y approximating from -70 to 70');
xlabel('n');
axis tight
ylabel('y[n]');

% Part I
% Plot the harmonics
figure();
plot(nt_s, kth_harmonic(nt_s, 0, a_k3_array, prd, k_lim),'b');
hold on
plot(nt_s, kth_harmonic(nt_s, 1, a_k3_array, prd, k_lim),'r');
hold on
plot(nt_s, kth_harmonic(nt_s, 2, a_k3_array, prd, k_lim),'k');
hold on
plot(nt_s, kth_harmonic(nt_s, 3, a_k3_array, prd, k_lim),'m');
title('0th, 1st, 2nd and 3rd Harmonics of y(t)');
xlabel('t');
axis tight
grid on
legend('0th Harmonic','1st Harmonic','2nd Harmonic','3rd Harmonic');
hold off

% Part E,F,G,H
for r = [25, 7, 3, 1]
    %figure();
    k_lim = r;
    a_k3_array = a_k3(k_lim);
    %stem(-k_lim:k_lim, a_k3_array);
    figure();
    plot(n, fourier_ser(nt_s,prd,a_k3_array, k_lim));
    title(['FSE for y approximating from -', num2str(r), ' to ', num2str(r)]);
    xlabel('n');
    ylabel('y[n]');
    axis tight
    
end   

%% Functions

function out = a_k1(k_lim)
out = zeros(0,k_lim);
k_rng = -1*k_lim:k_lim;
for k = k_rng
    if(k==0)
        temp = 5/6;
    else 
        temp = ((5*i)/(2*pi*k)) * (exp(-i*k*pi) - exp(-i*(2/3)*pi*k));
    end
    out(k+k_lim+1) = temp;
end
end

function out = a_k2(k_lim)
out = zeros(0,k_lim);
k_rng = -1*k_lim:k_lim;
for k = k_rng
    if(k==1/2)
        temp = 8*i/(3*pi);
    elseif(k==-1/2)
        temp = 8*i/(3*pi);
    else
        temp = 8*cos(pi*k) / (pi*(1-4*k^2));
    end
    out(k+k_lim+1) = temp;
end
end

function out = a_k3(k_lim)
out = zeros(0,k_lim);
k_rng = -1*k_lim:k_lim;
for k = k_rng
    if(k==1)
        temp = 1;
    elseif(k==-1)
        temp = 1;
    else
        temp = (-4*cos(pi*k/ 2)) / (pi*(k^2-1));
    end
    out(k+k_lim+1) = temp;
end
end

function out = fourier_ser(nt_s,period, a_k, rng)
    out = 0;
    for ind = -rng:rng
        out = out + a_k(ind+rng+1).* exp(i*(2*pi/period).*ind.*nt_s);
    end 
end

function out = kth_harmonic(nt_s, k, a_k, period, rng)
if k == 0
    out = a_k(rng+k+1).* exp(i*(2*pi/period).*k.*nt_s);
else
    out = a_k(rng+k+1).* exp(i*(2*pi/period).*k.*nt_s)...
        + a_k(rng-k+1).* exp(-i*(2*pi/period).*k.*nt_s);
end
end
