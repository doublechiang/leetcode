def reverse(x)

    sign = false
    if x<0
        sign=true
        x=x.abs
    end
    y=x.to_s.split("").reverse.join.to_i

    if sign
        y=-y
    end
        
    if y.bit_length > 31
        y=0
    end
    y

end


p reverse(123)
p reverse(-123)
p reverse(120)
p reverse(1534236469)

