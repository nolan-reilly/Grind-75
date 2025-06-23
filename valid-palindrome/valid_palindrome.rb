# ------------------------------------------------------------------------------
# Things I Learned From This Problem
# ------------------------------------------------------------------------------
# - Learned about basic regex's in Ruby along with the 'match' 
#   function: `/[a-zA-Z0-9]/`
# ------------------------------------------------------------------------------

# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  # ----------------------------------------------------------------------------
  # O(n) Two-Pointer Solution
  # Idea: Clean input string to include only alphanumeric chars (lowercased),
  # then use two pointers to compare characters from both ends inward.
  # ----------------------------------------------------------------------------

  cleaned = []

  s.chars.each do |char|
    if char.match?(/[a-zA-Z0-9]/)
      cleaned.push(char.downcase)
    end
  end

  left = 0
  right = cleaned.length - 1

  while left <= right
    if cleaned[left] != cleaned[right]
      return false
    end

    left += 1
    right -= 1
  end

  true

  # ------------------------------------------------------------------------------
  # Alternate Approach (Also O(n))
  # Idea: Manually build cleaned array with range comparisons.
  # Then compare it to its reversed version.
  # ------------------------------------------------------------------------------
  #
  # cleaned = []
  #
  # s.chars.each do |c|
  #   if (c >= "a" && c <= "z") ||
  #      (c >= "A" && c <= "Z") ||
  #      (c >= "0" && c <= "9")
  #     cleaned.push(c.downcase)
  #   end
  # end
  #
  # reversed = cleaned.reverse
  # cleaned == reversed
end