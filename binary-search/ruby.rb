# ------------------------------------------------------------------------------
# Things I Thought About From This Problem
# ------------------------------------------------------------------------------
# - Remembered that Ruby automatically performs integer division when using `/`.
# ------------------------------------------------------------------------------

def search(nums, target)
  # ----------------------------------------------------------------------------
  # O(log n) Binary Search
  # Idea: Use two pointers (left and right) to narrow down the search space.
  # At each step, check the middle element:
  #   - If equal to target: return index
  #   - If less than target: shift left pointer to mid + 1
  #   - If greater than target: shift right pointer to mid - 1
  # Loop ends when left > right (target not found).
  # ----------------------------------------------------------------------------

  left = 0
  right = nums.length - 1

  while left <= right
    middle = (left + right) / 2  # Integer division in Ruby

    if nums[middle] == target
      return middle
    elsif nums[middle] < target
      left = middle + 1
    else
      right = middle - 1
    end
  end

  # If we exhaust the search space and don't find the target
  -1
end