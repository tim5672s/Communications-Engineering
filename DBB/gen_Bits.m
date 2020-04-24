%Bit-Generator
%
%function generates random bits in grid of 0 and 1
%N: number of randomly generated bits
%v_u: line vector of randomly generated bits 
function[v_u] = gen_Bits(N)

v_u = round(rand(1,N));

end




%   Aufgabe 1a)
%   
%   rand gibt eine random - Matrix zurück 
%   randn gibt ein random - Skalar zurück
