# x'' + 2.4x' + 2.5x = 0.2sin(2.6t)
using DifferentialEquations
using Plots

function func!(du, u, p, t)
    a, b = p
    du[1] = u[2]
    du[2] = -a*du[1] - b*u[1] + 0.2*sin(2.6*t)
end

# начальные условия
const x = 1.2
const y = -1.2
u0 = [x, y]

p = (2.4, 2.5)
tspan = (0.0, 72.0) # временной интервал, на котором происходит моделирование
prob = ODEProblem(func!, u0, tspan, p)
sol = solve(prob, dtmax = 0.05)

using Plots; gr()

# решение системы уравнений
plot(sol, xlabel="x", ylabel="y")
savefig("C:/work/study/2023-2024/Математическое моделирование/mathmod/labs/lab4/lab4_julia_33.png")

# фазовый портрет
plot(sol, vars=(2,1), xlabel="y", ylabel="x")
savefig("C:/work/study/2023-2024/Математическое моделирование/mathmod/labs/lab4/lab4_julia_33_phase.png")
