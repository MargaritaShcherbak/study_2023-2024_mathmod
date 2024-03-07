using Plots
using DifferentialEquations

# начальные условия
x0 = 8
y0 = 15

a = 0.7 # коэффициент естественной смертности хищников
b = 0.06 # коэффициент естественного прироста жертв
c = 0.6 # коэффициент увеличения числа хищников
d = 0.07 # коэффициент смертности жертв 


function f(du, u, p, t)
    x, y = u
    du[1] = -a*u[1] + b * u[1] * u[2]
    du[2] = c * u[2] - d * u[1] * u[2]
end

v0 = [x0, y0]
tspan = (0.0, 200.0)
prob = ODEProblem(f, v0, tspan)
sol = solve(prob, dtmax=0.05)
X = [u[1] for u in sol.u]
Y = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt = plot(
  dpi=300,
  legend=false)

plot!(
  plt,
  Y,
  X,
  color=:blue)

# зависимость численности хищников от численности жертв в виде фазового портрета
savefig(plt, "C:/work/study/2023-2024/Математическое моделирование/mathmod/labs/lab5/lab05_1.png")

plt2 = plot(
  dpi=300,
  legend=true)

plot!(
  plt2,
  T,
  X,
  label="Численность жертв",
  color=:red)

plot!(
  plt2,
  T,
  Y,
  label="Численность хищников",
  color=:green)

# изменение численности хищников и жертв во времени
savefig(plt2, "C:/work/study/2023-2024/Математическое моделирование/mathmod/labs/lab5/lab05_2.png")
