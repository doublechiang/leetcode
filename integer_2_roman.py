class Solution:
    def intToRoman(self, num: int) -> str:
        number = num
        base = 1
        roman_str = ""
        while number > 9:
            repr = number % 10
            number = int(number /10)
            roman_str = self.__to_Roman_symbol(repr, base) + roman_str
            base *= 10
        roman_str  = self.__to_Roman_symbol(number, base) + roman_str
        return roman_str

    def __to_Roman_symbol(self, num: int, base):
        symbol = { 1: ["I", "V"],
            10: [ "X", "L"],
            100: [ "C", "D"],
            1000: [ "M"]
        }

        if (num < 4):
            return (symbol[base][0] * num)
        elif (num == 4 ):
            return symbol[base][0] + symbol[base][1]
        elif (num == 5 ):
            return symbol[base][1]
        elif (num < 9):
            count =  num -5
            return symbol[base][1] + symbol[base][0] * count
        else:
            return symbol[base][0] + symbol[base*10][0] 
            


if __name__ == "__main__":
    assert(Solution().intToRoman(3) == "III")
    assert(Solution().intToRoman(5) == "V")
    assert(Solution().intToRoman(1994)== "MCMXCIV")
    assert(Solution().intToRoman(9) == "IX") 
    assert(Solution().intToRoman(58) == "LVIII") 