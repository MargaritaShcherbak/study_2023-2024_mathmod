model lab6
parameter Real N=12700;
parameter Real a=0.01;
parameter Real b=0.02;
parameter Real I0=170;
parameter Real R0=57;
parameter Real S0=N-I0-R0;
Real S(start = S0);
Real I(start = I0);
Real R(start = R0);
Real S1(start = S0);
Real I1(start = I0);
Real R1(start = R0);

equation
der(S) = 0;
der(I) = -b*I;
der(R) = b*I;
der(S1) = -a*S1;
der(I1) = a*S1 - b*I1;
der(R1) = b*I1;
end lab6;
