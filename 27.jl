function tail_function(a::Vector{Any})
    if length(a) == 1
        return a[1]
    end

    b = []
    for i in 2:length(a)
        push!(b, a[i])
    end

    return a[1] + tail_function(b)
end