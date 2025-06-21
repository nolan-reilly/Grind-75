# Things learned from this problem
# - #each_with_index (Basically just an each loop but you get access to its current index)
# - Ruby isn't like python where you can just say in for Arrays or Hashes
# - Instead of in we can use #include?, #key?, #value? for arrays or hashes


def two_sum(nums, target)
    # O(n) Solution: Storing every value we search in a hash
    # ---------------------------------------------------------------------------

    hash = {}

    nums.each_with_index do |num, i|
        # Check if the value is already looped through
        val = target - num
        if hash.key?(val)
            return [i, hash[val]]
        end

        # If we didn't find a match store the number
        hash[num] = i
    end


    # Brute Force Solution O(n^2): Check every possible combination
    # ---------------------------------------------------------------------------

    nums.each_with_index do |x, i|
        nums.each_with_index do |y, j|

            next if j >= i # Don't overlap or be on the same index

            if x + y == target
                return [i, j]
            end
        end
    end
end