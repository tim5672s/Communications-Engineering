%Parameter
A = 1;
T = 1;
N =1000;
%EsN0 Werte
EsNo = 0:0.5:10;
%Vektor für BER mit Nullen
BER = zeros(1, length(EsNo));
Schrittweite = 0.01;
 t = 0.01:0.01:2;
%Sendeimpuls
g_s = [ones(1,100) zeros(1,100)];
%Empfangsfilter
h_t = (1 / (A*T)) .* g_s ;
    
%Schleife für Bitfehlerrate
 for i = 1:length(EsNo)
    Fehler = 0;
    Index = 0;
    while Fehler <= 100
        N_Bits = gen_Bits(1000);
        y = myBPSK(N_Bits);
        %Auffüllen mit Nullen
        y_s = upsample(y,100);
        %Faltung
        gsx = conv(y_s, g_s);
        %Rauschen
        n = myNoise(gsx, EsNo(i));
        x = conv(h_t, n);
        x_s = x(1, 1:100100);
        x_s = x_s*Schrittweite;
        %Abtasten des Vektors
        xnt = x_s(101:100:end);
         
        u_det = myDetector(xnt);
         
        Fehler = Fehler + sum(N_Bits ~= u_det)
        Index = Index +1
    end
    BER(i) = Fehler/N*Index;
end
%Plotten
BER_real = 0.5*erfc(sqrt(10.^(EsNo/10)));
    
semilogy(EsNo, BER, EsNo, BER_real);
hold
grid
title('Bitfehler in Abhängigkeit vom Signal-Störabstand');
xlabel('EsNo in dB');
ylabel('Bitfehlerrate');
saveas(gcf,'Bitfehler in Abhängigkeit vom Signal-Störabstand.png');   
  
