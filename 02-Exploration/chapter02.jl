
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
