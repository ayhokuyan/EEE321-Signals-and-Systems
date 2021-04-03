%% load
data = load('y1_n');
%% Q5
alpha = 1000;
param = 512;
sample_time = sqrt(pi./(param.*alpha));
sample_freq = 3./sample_time;
player = audioplayer(xf_n, sample_freq);
period = sample_time.*length(xf_n);
 while(1)
     play(player);
     pause(period-0.1);
     stop(player);
 end
%% Q6
alpha = 1000;
param = 8192;
sample_time = sqrt(pi./(param.*alpha));
sample_freq = 1./sample_time;
player = audioplayer(y2_n, sample_freq);
getaudiodata()
period =  sample_time.*length(y2_n);
 while(1)
     play(player);
     pause(period-0.1);
     stop(player);
 end
 
 %% Q8
 [music frq] = audioread('AJudas.mp3');
 cropped = music(1:1000000,[1,2]);
 sound(cropped,frq);
 
%% Q8B
 cropped_tr = cropped';
 filtr_msc_1 = conv(cropped_tr(1,1:end),h_n);
 filtr_msc_2 = conv(cropped_tr(2,1:end),h_n);
 filtr_msc = [filtr_msc_1; filtr_msc_2];
 sound(filtr_msc,frq);
 
 %% Q9
 [record frq_2] = audioread('Kay?t.m4a');
 cropped = record(1:end,[1,2]);
 sound(cropped,frq_2);
 
%% Q9B
 cropped_tr = cropped';
 filtr_msc_1 = conv(cropped_tr(1,1:end),h_n);
 filtr_msc_2 = conv(cropped_tr(2,1:end),h_n);
 filtr_msc = [filtr_msc_1; filtr_msc_2];
 sound(filtr_msc,frq);
 
 
 
 