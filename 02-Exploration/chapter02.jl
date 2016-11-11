
using DataFrames
df = readtable("data/01_heights_weights_genders.csv")

heights = df[:Height]

median(heights)

mean(heights)

function mymean(x) 
    return (sum(x) / length(x))
end


function mymedian(x)
    sorted = sort(x)
    if length(x) % 2 == 0
        indices = Array{Int64}(2) 
        indices = [Int64(length(x)/2), Int64(length(x)/2 + 1)]
        return (sorted[indices[1]] + sorted[indices[2]]) / 2
    else 
        index = ceil(length(x)/2)
        return mean(sorted[index])
    end
end

array = [0,100]

mean(array)

median(array)

array = [0, 0, 100]

mean(array)

median(array)

mymean(heights)

mymedian(heights)

mean(heights) - mymean(heights)

median(heights) - mymedian(heights)

minimum(heights)

maximum(heights)

extrema(heights)

quantile(heights, [0, 0.25, 0.5, 0.75, 1])

quantile(heights, collect(0:0.2:1))

collect(0:0.2:1)

function myvar(x)
    m = mean(x)
    return sum(map(val -> (val - m) ^ 2, x)) / length(x)
end

myvar(heights)

var(heights)

function myunbiasedvar(x)
    m = mean(x)
    return sum(map(val -> (val - m) ^ 2, x)) / (length(x) - 1)
end

myunbiasedvar(heights)

var(heights)

mean(heights) - var(heights), mean(heights) + var(heights)

mean(heights) - var(heights), mean(heights) + var(heights)

extrema(heights)

function mystd(x)
    return sqrt(myunbiasedvar(x))
end

mystd(heights)

std(heights)

mean(heights) - std(heights), mean(heights) + std(heights)

extrema(heights)


mean(heights) - std(heights), mean(heights) + std(heights)


quantile(heights, 0.25), quantile(heights, 0.75)

using Gadfly
plot(df, x="Height", Geom.histogram(bincount=25))

plot(df, x="Height", Geom.histogram(bincount=5))

plot(df, x="Height", Geom.histogram(bincount=10000))

plot(df, x="Height", Geom.histogram)

plot(df, x="Height", y="Gender", Geom.density)

plot(df, x="Height", y="Gender", color="Gender", Geom.density)

plot(df, x="Weight", y="Gender", color="Gender", Geom.density)

plot(df, ygroup="Gender" ,x="Weight", y="Gender", color="Gender", Geom.subplot_grid(Geom.density))



using Distributions

plot(DataFrame(X = rand(Normal(0, 1), 10000) + rand_normal(0, 1)), x="X", Geom.density)



srand(1)
normal_values = rand(Normal(0, 1), 250)
cauchy_values = rand(Cauchy(0, 1), 250)
extrema(normal_values)

extrema(cauchy_values)

plot(DataFrame(X = normal_values), x="X", Geom.density, Guide.title("Normal distribution"))


plot(DataFrame(X = cauchy_values), x="X", Geom.density, Guide.title("Cauchy distribution"))


gamma_values = rand(Gamma(1, 0.001), 100000)
plot(DataFrame(X = gamma_values), x="X", Geom.density, Guide.title("Gamma values"))


plot(df, x="Height", y="Weight", Geom.point)

xmin, xmax = extrema(df[:Height])
ymin, ymax = extrema(df[:Weight])
plot(layer(df, x="Height", y="Weight", Geom.point, order = 1),
layer(x=[xmin, xmax],y=[ymin, ymax], Geom.point,Geom.line, Theme(default_color=colorant"purple"), order = 10))


plot(df[1:21,:], x="Height", y="Weight", Geom.point)

plot(df[1:201,:], x="Height", y="Weight", Geom.point)

plot(df[1:2001,:], x="Height", y="Weight", Geom.point)

plot(df, x="Height", y="Weight", Geom.point, color="Gender")

xmin, xmax = extrema(df[:Height])
ymin, ymax = extrema(df[:Weight])
plot(layer(df, x="Height", y="Weight", Geom.point, color="Gender", order = 1),
layer(x=[xmin, xmax],y=[ymin, ymax], Geom.point,Geom.line, Theme(default_color=colorant"purple"), order = 10))

