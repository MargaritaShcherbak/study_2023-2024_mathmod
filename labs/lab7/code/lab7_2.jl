using Plots
using DifferentialEquations

N = 1130 #объем аудитории
n0 = 11

function f(du, u, p, t)
    (n) = u
    du[1] = (0.000075 + 0.25*u[1])*(N - u[1])
end

v0 = [n0]
tspan = (0.0, 0.1)
prob = ODEProblem(f, v0, tspan)
sol = solve(prob)

n = [u[1] for u in sol.u]
T = [t for t in sol.t]

plt = plot(
  dpi = 600,
  title = "Эффективность распространения рекламы (2) ",
  legend = false)
plot!(
  plt,
  T,
  n,
  color = :red)

savefig(plt, "lab7_2.png")
