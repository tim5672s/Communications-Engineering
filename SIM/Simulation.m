%%Simulation of a digital simulation system

%clear command window and clos all
clear all
close all
clc

%probability density function from 0 to 10
EsNo_dB = [0:0.5:10];

BitErrRat = zeros(1, length(EsNo_dB));
BitErrRat_2 = BitErrRat;

N = 1000;               %number of randomly generated bits
min_Errors = 100;       % min val of bit errors

for(i=1:1:length(EsNo_dB))
    
    Errors = 0;
    EsNo = 10^(EsNo_dB(i) / 10)
    Bits = 0;
    
    while(Errors < min_Errors)          %loop 
        
        v_u = genBits(N);              % generate random Bits
        v_x = modBPSK(v_u);            %BPSK modulation
        v_y = noiseAWGN(v_x, EsNo);    %modulation AWGN of  noise
        [v_x_det, v_u_det] = bitDetector(v_y); %bit detection
        
        v_f = xor(v_u_det, v_u);        %comparison of generated and transmitted Bits
        BitErrors = sum(v_f);           % sums up bit errors 
        
        Errors = Errors + BitErrors;
        Bits = Bits + N;
    end
    
    BitErrRat(i) = (Errors / Bits);
    BitErrRat_2(i) = .5 * erfc(sqrt(EsNo));
end


semilogy(EsNo_dB, BitErrRat);           
grid on
hold on

semilogy(EsNo_dB, BitErrRat_2);         
grid on

BitErrRat
BitErrRat_2


title('Monte - Carlo - Simulation (Bitfehlerrate)');
xlabel('E_s/N_0 [dB]');
ylabel('Bitfehlerrate');
legend('BER simuliert', 'BER errechnet');

saveas(gcf,'MonteCarloSimulation.png');
