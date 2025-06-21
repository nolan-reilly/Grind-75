# -----------------------------------------------------------------------------
# Things I Learned From This Problem
# -----------------------------------------------------------------------------
# - '.each_with_index': Like .each, but also gives access to the index
# - In Ruby, you can't use Python style of 'in' checks for array or hashes
# - Instead we use:
#   - '.include?' -> for arrays
#   - '.key?' or '.value?' -> for hashes
# -----------------------------------------------------------------------------


def two_sum(nums, target)
    # -------------------------------------------------------------------------
    # O(n) Solution
    # Idea: Use a hash map to store previously seen numbers. For each number,
    # check if (target - num) exists in the hash.
    # -------------------------------------------------------------------------

    hash = {}

    nums.each_with_index do |num, i|
        complement = target - num

        # If the complement is found, return its idx and the current idx
        if hash.key?(complement)
            return [i, hash[complement]]
        end

        hash[num] = i # If we didn't find a match store the number
    end

    
    # -------------------------------------------------------------------------
    # Brute Force O(n^2)
    # Idea: Check all possible pairs
    # -------------------------------------------------------------------------

    nums.each_with_index do |x, i|
        nums.each_with_index do |y, j|

            next if j >= i # Don't overlap or be on the same index

            if x + y == target
                return [i, j]
            end
        end
    end
end