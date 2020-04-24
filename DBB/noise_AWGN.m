%AGWN-Kanal 
%
%v_x: line vector with BPSK-modulatet symbols 
%EsNo: E_s/N_o
%v_y: line vector with noisy reception symbols

function[v_y] = noise_AWGN(v_x, EsNo, Schrittweite)
    EsNo = 10^(EsNo/10);
    sigma = sqrt(1/(2*EsNo)*(1/Schrittweite));
    
    n = randn(1,length(v_x)).*sigma;
    v_y= v_x + n;

end
