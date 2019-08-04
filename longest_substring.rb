def length_of_longest_substring(s)
    ar=s.split("")
    longest = 0
    while ar.length > 0
        length = find_sub(ar)

        if (length > longest)
            longest = length
        end
        ar.shift
   end
    longest

end

# find the longest sub string
def find_sub(s)
    existing = []
    sub = s.dup

    while sub.length > 0
        char= sub.shift
        unless existing.include?(char)
            existing << char
        else
            break
        end
    end
    return existing.length
end


#p find_sub ("abcabc".split(""))
#p find_sub ("bbbb".split(""))
#p find_sub ("pwwkew".split(""))
p length_of_longest_substring("pwwkew") 
