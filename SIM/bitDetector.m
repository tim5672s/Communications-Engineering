%Bit-Detector
%
%v_y: line vector with noisy reception symbols 
%v_x_det: detected reception symbols (hard decision)
%v_u_det: detected reception bits (hard decision)

function[v_u_det, v_x_det] = bit_Detector(v_y)

v_x_det = sign(v_y);

v_u_det(v_x_det < 0) = 1;   %decode the signals 
v_u_det(v_x_det >= 0) = 0;  % "

end
