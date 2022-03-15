function zfromtau = tau2z(tau,numpairs)

if nargin < 2
    numpairs=6;
end

zfromtau = (3*tau * sqrt(numpairs*(numpairs-1))) / sqrt(2*(2*numpairs +5));

end