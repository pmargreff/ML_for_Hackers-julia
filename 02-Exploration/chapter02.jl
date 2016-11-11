
using DataFrames
df = readtable("data/01_heights_weights_genders.csv")

heights = df[:Height]

minimum(heights)



median(heights)

mean(heights)

maximum(heights)

function mymean(x) 
    return (sum(x) / length(x))
end


function mymedian(x)
    sorted = sort(x)
    if length(x) % 2 == 0
        indices = length(x)/2,length(x) / 2 + 1
        return mean(sorted[indices])
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
