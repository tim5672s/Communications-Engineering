%   plots density function of gaussian noise
close all

v_n_help_pos = [];
v_n_help_neg = [];


% EsNo = 1 dB
v_n = noise_AWGN(v_x,1);
histfit(v_n)

for i = 1 : 1000
  if v_n(i) > 0 
    v_n_help_pos = [v_n_help_pos v_n(i)];
  else 
    v_n_help_neg = [v_n_help_neg v_n(i)];
  end    
end

histfit(v_n_help_neg)
hold 
histfit(v_n_help_pos)


title('Wahrscheinlichkeitsdichtefunktion für E_s/N_0 = 1 dB')
xlabel('')
ylabel('')
saveas(gcf,'WDF_EsNo1dB.png')

close all


% EsNo = 9.6 dB
v_n = noise_AWGN(v_x,9.6);
histfit(v_n)

for i = 1 : 1000
  if v_n(i) > 0 
    v_n_help_pos = [v_n_help_pos v_n(i)];
  else 
    v_n_help_neg = [v_n_help_neg v_n(i)];
  end    
end

histfit(v_n_help_neg)
hold 
histfit(v_n_help_pos)

title('Wahrscheinlichkeitsdichtefunktion für E_s/N_0 = 9,6 dB')
xlabel('')
ylabel('')
saveas(gcf,'WDF_EsNo96dB.png')
