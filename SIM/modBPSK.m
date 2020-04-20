13 lines (9 sloc)  211 Bytes
  
%BPSK-Modulation
%
%v_u: loine vector with randomly generated bits
%v_x: line vector with BPSK-modulated symbols

function[v_x] = mod_BPSK(v_u)

v_neg = v_u * -(1);
v_pos = v_neg + 1;

v_x = v_pos + v_neg;

en
