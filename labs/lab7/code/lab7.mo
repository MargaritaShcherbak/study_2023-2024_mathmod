model lab7
parameter Real N = 1130;
  Real n(start = 11);
  Real n1(start = 11);
  Real n2(start = 11);

equation
  der(n) = (0.25+0.000075*n)*(N-n);
  der(n1) = (0.000075+0.25*n1)*(N-n1);
  der(n2) = (0.25*sin(time)+0.75*time*n2)*(N-n2);

end lab7;
