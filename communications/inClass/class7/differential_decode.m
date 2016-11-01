function bits = differential_decode(raw_demod)
 bits = (sign(raw_demod(2:end))-sign(raw_demod(1:end-1))==0);
end