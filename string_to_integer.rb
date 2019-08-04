# @param {String} str
# @return {Integer}
def my_atoi(str)
  array=str.chomp.strip.split("")
  minus = false
  if (array[0] == '-' || array[0] == '+')
    minus =true if array[0] == '-'
    array.shift
  end

  legal_str=[]
  while array.length > 0
    char = array.shift
    if (char >= '0' && char <= '9')
      legal_str << char
    else
      # non digit started, illegal String
      break
    end
  end

  order =1
  num =0
  while legal_str.length > 0
    num += legal_str.pop.to_i * order
    order *=10
  end

  num *= -1 if minus

  if num.bit_length > 31
    num = 2**31 -1
    if minus
      num = -2 **31
    end
  end

  num

end


p my_atoi("    -42")
p my_atoi("4193 with words")
p my_atoi("words and 987")
p my_atoi("-91283472332")
