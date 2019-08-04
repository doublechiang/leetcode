# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    sum = get_reverse_numbers(l1) + get_reverse_numbers(l2)
    convert_to_list(sum)
end


def get_reverse_numbers(al)
    array = []
    node = al
    begin
        array << node.val
    end while node.next != nil && node = node.next
    array.reverse.join.to_i
end

def convert_to_list(num)
    array=num.to_s.split("").reverse
    current = nil
    listHead = nil
    begin
        char = array.shift
        node = ListNode.new(char.to_i)
        if (listHead == nil)
            listHead = node
        end

        if (current != nil)
            current.next = node
        end

        current = node
    end while array.length != 0
    listHead
end

p add_two_numbers(convert_to_list(342), convert_to_list(465))







