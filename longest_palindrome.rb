# @param {String} s
# @return {String}
def longest_palindrome(s)
    return "" if s.empty?

    head, tail = 0, 0

    i = 0
    while i < s.size
        len1 = find_palindrome(s, i, i)
        len2 = find_palindrome(s, i, i + 1)
        len = [len1, len2].max
#        puts "len=#{len}"
        if tail - head < len
            head = i - (len - 1) / 2
            tail = i + len / 2
        end
#        puts "head=#{head}, tail=#{tail}"

        i += 1
    end

    s[head..tail]
end

def find_palindrome(s, left, right)
#    puts "Checking #{s[left..right]}, i=#{left}, j=#{right}"

    l, r = left, right
    while 0 <= l && r < s.size && s[l] == s[r]
        l -= 1
        r += 1
#        puts "l=#{l}, r=#{r}"
    end
    r - l - 1
end

# leetcode might has problem in DP solution on Ruby
# https://leetcode.com/problems/longest-palindromic-substring/discuss/160601/Ruby-dp-solution-not-TLE-possible

def longest_palindrome_dp(s)

  return "" if s.length == 0

  start_idx = 0
  # every char is palindrome.
  longest = 1
  longest_str = s[0]
  # create a 2 dimentional array for quick computing.

  matrix = Array.new(s.length) {Array.new(s.length, nil)}
  # by define, single character is palindrome
  # search for 2 letter, if found 2 length, then start search on 3.

  scan_len = longest +1
  while scan_len <= s.length
    start_idx = 0
    while start_idx + scan_len <= s.length
#        puts "Checking #{s[start_idx..start_idx+scan_len-1]}, i=#{start_idx}, j=#{start_idx+scan_len-1}"
      if is_palindrome(s, matrix, start_idx, start_idx + scan_len-1)
        longest = scan_len
        longest_str = s[start_idx..start_idx+scan_len-1]
        # in this iteration, found it, go to find next
        start_idx +=1
        break
      end
      start_idx +=1
    end
    scan_len +=1
  end
  longest_str

end


# the base case for palindrome is
# p(i,i)
# p(i, j), where j =i+1 and S(i) = S(j)

def is_palindrome(s, matrix, i, j)
  #if there is only one char, then it true by definition.
  #puts "calling checking is palindrome, #{s[i..j]}, i=#{i}, j=#{j}, matrix value is #{matrix[i][j]}"
  return matrix[i][j] unless matrix[i][j] == nil

  if i == j
    return matrix[i][j] = true
  elsif j ==  i+1
    return matrix[i][j] = true if s[i] == s[j]
  end

  if s[i] == s[j] && is_palindrome(s, matrix, i+1, j-1)
    return matrix[i][j] = true
  end

  # no other condition, this is a
  return matrix[i][j] = false
end

#p longest_palindrome("babad")
#p longest_palindrome("cbbd")
#p longest_palindrome("a") == "a"
#p longest_palindrome("abcdbbfcba") == "bb"
#p longest_palindrome("bb") == "bb"
#p longest_palindrome("aaaaaaaaaaaaaaaaaaaaaaaa") == "aaaaaaaaaaaaaaaaaaaaaaaa"
#p longest_palindrome("abacab") == "bacab"
#p longest_palindrome("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
p longest_palindrome("aaaabbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
