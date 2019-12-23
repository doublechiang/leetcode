class Solution:
    def convert(self, s: str, numRows: int) -> str:
        zigzag = [ [] for i in range(numRows)]
        self.row = -1
        self.down = True
        for i in s:
            row=self.__get_row_num(numRows)
            zigzag[row].append(i)
        ret = ""
        for i, value in enumerate(zigzag):
            ret += ''.join(value)
        return ret

    def __get_row_num(self, numRows: int):
        if self.down:
            self.row += 1
            if self.row == numRows:
                self.row -= 2
                self.down =False
        else:
            # up case
            self.row -= 1
            if self.row < 0:
                self.down = True
                self.row +=2
        return self.row

if __name__ == "__main__":
    assert (Solution().convert("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR")
    assert (Solution().convert("PAYPALISHIRING", 4) == "PINALSIGYAHRPI")
        