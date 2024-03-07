model Animals

parameter Real a=0.7;
parameter Real b=0.06;
parameter Real c=0.6;
parameter Real d=0.07;

Real x(start=8);
Real y(start=15);
Real xst(start=c/d);
Real yst(start=a/b);

equation
der(x)=-a*x+b*x*y;
der(y)=c*y-d*x*y;
der(xst)=-a*xst+b*xst*yst;
der(yst)=c*yst-d*xst*yst;

end Animals;
