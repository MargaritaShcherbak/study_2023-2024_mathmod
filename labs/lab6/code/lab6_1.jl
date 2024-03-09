#I0 <= I*

using Plots
using DifferentialEquations

N = 12700 # все проживающие на острове
I0 = 170 # заболевшие 
R0 = 57 # с иммунитетом
S0 = N - I0 - R0 # восприимчивые к болезни, но пока здоровые
alpha = 0.01 # коэффициент заболеваемости
beta = 0.02 # коэффициент выздоровления

function f(du, u, p, t)
    S, I, R = u
    du[1] = 0
    du[2] = -beta*u[2]
    du[3] = beta*I
end

v0 = [S0, I0, R0]
tspan = (0.0, 800.0)
prob = ODEProblem(f, v0, tspan)
sol = solve(prob, dtmax = 0.05)

S = [u[1] for u in sol.u]
I = [u[2] for u in sol.u]
R = [u[3] for u in sol.u]
T = [t for t in sol.t]

plt = plot(
  dpi = 600,
  legend = :topright)
plot!(
  plt,
  T,
  S,
  label = "восприимчивые к болезни, но пока здоровые",
  color = :green)
plot!(
  plt,
  T,
  I,
  label = "заболевшие ",
  color = :red)
plot!(
  plt,
  T,
  R,
  label = "с иммунитетом",
  color = :blue)

savefig(plt, "lab6_1.png")