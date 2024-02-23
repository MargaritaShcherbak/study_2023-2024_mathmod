model task3

type Units = Real (unit="Units");

parameter Real a = 0.4;
parameter Real b = 0.67;
parameter Real c = 0.77;
parameter Real h = 0.14;

parameter Real a1 = 0.24;
parameter Real b1 = 0.67;
parameter Real c1 = 0.47;
parameter Real h1 = 0.14;

Units x(start = 882000);
Units y(start = 747000);

Units x1(start = 882000);
Units y1(start = 747000);

equation
der(x) = -a*x - b*y + sin(3*time) + 1;
der(y) = -c*x - h*y + cos(2*time) + 2;

der(x1) = -a1*x1 - b1*y1 + abs(sin(2*time));
der(y1) = -c1*x1*y1 - h1*y1 + abs(cos(2*time));
end task3;
