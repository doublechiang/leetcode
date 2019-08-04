def is_palindrome(x)

    y=x.to_s.split("").reverse.join
    x.to_s.eql? y
end
