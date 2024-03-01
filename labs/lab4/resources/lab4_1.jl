# x'' + 21x = 0
using DifferentialEquations
using Plots

function func!(du, u, p, t)
    a = p
    du[1] = u[2]
    du[2] = -a*u[1]
end

# начальные условия
const x = 1.2
const y = -1.2
u0 = [x, y]

p = (21) # коэффициент a из уравнения
tspan = (0.0, 72.0) # временной интервал, на котором происходит моделирование
prob = ODEProblem(func!, u0, tspan, p)
sol = solve(prob, dtmax = 0.05)

using Plots; gr()

#решение системы уравнений
plot(sol)
savefig("C:/work/study/2023-2024/Математическое моделирование/mathmod/labs/lab4/lab4_julia_1.png")

#фазовый портрет
plot(sol, vars=(2,1))
savefig("C:/work/study/2023-2024/Математическое моделирование/mathmod/labs/lab4/lab4_julia_1_phase.png")