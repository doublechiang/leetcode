def two_sum(nums, target)
    
    base =0
    while base < nums.length
        oppo = base +1
        while oppo < nums.length
            if nums[base] + nums[oppo]  == target
                return [base, oppo]
            end
            oppo +=1
        end
        base +=1
    end
end

p two_sum([2, 7, 11, 15], 9)

