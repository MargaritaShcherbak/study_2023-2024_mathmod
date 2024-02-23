using Plots
using DifferentialEquations

function model1(du, u, p, t)
    du[1] = -0.4*u[1] - 0.67*u[2] + sin(3*t) + 1
    du[2] = -0.77*u[1] - 0.14*u[2] + cos(2*t) + 2
end

function model2(du, u, p, t)
    du[1] = -0.24*u[1] - 0.67*u[2] + abs(sin(2*t))
    du[2] = -0.47*u[1]*u[2] - 0.14*u[2] + abs(cos(2*t))
end

const people = Float64[21050, 8900]
const prom1 = [0.0, 3.0]
const prom2 = [0.0, 0.0007]

problem1 = ODEProblem(model1, people, prom1)
problem2 = ODEProblem(model2, people, prom2)

sol1 = solve(problem1, dtmax=0.1)
sol2 = solve(problem2, dtmax=0.000001)

A1 = [u[1] for u in sol1.u]
A2 = [u[2] for u in sol1.u]
A3 = [u[1] for u in sol2.u]
A4 = [u[2] for u in sol2.u]
T1 = [t for t in sol1.t]
T2 = [t for t in sol2.t]

plt1 = plot(dpi = 300, legend = true, bg =:white)
plot!(plt1, xlabel="Время", ylabel="Численность", title="Модель боевых действий случай 1")
plot!(plt1, T1, A1, label="Численность армии X", color =:red)
plot!(plt1, T1, A2, label="Численность армии Y", color =:green)
savefig(plt1, "lab3_1.png")

plt2 = plot(dpi = 1200, legend = true, bg =:white)
plot!(plt2, xlabel="Время", ylabel="Численность", title="Модель боевых действий случай 2")
plot!(plt2, T2, A3, label="Численность армии X", color =:red)
plot!(plt2, T2, A4, label="Численность армии Y", color =:green)
savefig(plt2, "lab3_2.png")
