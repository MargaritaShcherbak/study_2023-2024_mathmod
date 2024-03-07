model lab4_garmonica
Real x1(start=1.2);
Real y1(start=-1.2);

Real x2(start=1.2);
Real y2(start=-1.2);

Real x3(start=1.2);
Real y3(start=-1.2);

equation
y1=der(x1);
der(y1)+21*x1=0; 

y2=der(x2);
der(y2)+2.2*y2+2.3*x2=0; 

y3=der(x3);
der(y3)+2.4*y3+2.5*x3=0.2*sin(2.6*time); 

end lab4_garmonica;
