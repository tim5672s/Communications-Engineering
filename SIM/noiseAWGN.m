%AWGN-Kanal
%
%v_x: line vector with BPSK-modulatet symbols 
%EsNo: E_s/N_o
%v_y: line vector with noisy reception symbols

function[v_y, v_sigma] = noise_AWGN(v_x, EsNo)

v_sigma = sqrt(1/(2 * EsNo));
v_n = normrnd(0,v_sigma,[1,length(v_x)]);
v_y = v_x + v_n;

end
