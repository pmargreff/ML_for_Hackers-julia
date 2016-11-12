
using DataFrames
ages = readtable("data/longevity.csv")

using Gadfly
plot(ages, ygroup="Smokes" ,x="AgeAtDeath", color="Smokes", Geom.subplot_grid(Geom.density))

guess = 73
mean((ages[:AgeAtDeath] .- guess) .^ 2)

accurracy = DataFrame(Guess =  0.0, Error = 0.0)

for guess in 63:83
    erro = mean((ages[:AgeAtDeath] .- guess) .^ 2)
    push!(accurracy, @data([guess, erro]))
end

deleterows!(accurracy, 1)

plot(accurracy, x="Guess", y="Error", Geom.line)

guess = mean(ages[:AgeAtDeath])
sqrt(mean((ages[:AgeAtDeath] .- guess) .^ 2))


smokers = ages[ages[:Smokes] .== 1, :]
smokersguess = mean(smokers[:AgeAtDeath])

nonsmokers = ages[ages[:Smokes] .== 0, :]
nonsmokersguess = mean(nonsmokers[:AgeAtDeath])

ages[:NewPrediction] = zeros(nrow(ages))

for i in 1:nrow(ages)
    if ages[i, :Smokes] == 0
        ages[i, :NewPrediction] = nonsmokersguess
    else
        ages[i, :NewPrediction] = smokersguess
    end
end

sqrt(mean((ages[:AgeAtDeath] .- ages[:NewPrediction]).^2))

