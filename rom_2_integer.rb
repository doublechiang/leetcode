# @param {String} s
# @return {Integer}
def roman_to_int(s)

      array = s.split("")
      num = 0
      i_hitted = x_hitted =c_hitted = false
      while array.length > 0
          char = array.shift
          if char == 'M'
              num+=1000
              if c_hitted
                  num-=200
              end
              i_hitted = x_hitted =c_hitted = false
          elsif char == 'D'
              num+=500
              if c_hitted
                  num -= 200
              end
              i_hitted = x_hitted =c_hitted = false
          elsif char == 'C'
              num +=100
              if x_hitted
                  num-=20
              end
              c_hitted = true
          elsif char == 'L'
              num +=50
              if x_hitted
                  num -=20
              end
              i_hitted = x_hitted =c_hitted = false
          elsif char == 'X'
              num+=10
              if i_hitted
                  num-=2
              end
              x_hitted =true
          elsif char == 'V'
              num +=5
              if i_hitted
                  num-=2
              end
              i_hitted = x_hitted =c_hitted = false
          else char == 'I'
              num+=1
              i_hitted  =  true
          end
      end

      num

end


p roman_to_int("III")
p roman_to_int("IV")
p roman_to_int("IX")
p roman_to_int("LVIII")
p roman_to_int("MCMXCIV")
