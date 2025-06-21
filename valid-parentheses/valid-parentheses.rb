# -----------------------------------------------------------------------------
# Things I Learned From This Problem
# -----------------------------------------------------------------------------
# - Made me think more about the importance of array functions such as
#   .push, .pop, .unshift, .shift
# - Converting strings into char arrays using .chars as we can't loop through
#   strings
# -----------------------------------------------------------------------------

def is_valid(s)
  # ----------------------------------------------------------------------------
  # Stack-Based Solution (O(n) Time)
  # Idea: Use a stack to track opening brackets.
  # For every closing bracket, check if it matches the latest opening.
  # ----------------------------------------------------------------------------

  stack = []
  opening_brackets = ["(", "[", "{"]

  s.chars.each do |bracket|
      # Push all opening brackets onto the stack
      if opening_brackets.include?(bracket)
          stack.push(bracket)
          next
      end

      # We have nothing to match a closing bracket to 
      return false if stack.empty?

      top = stack.pop

      # Check for matching pairs
      if (top == "(" && bracket == ")") ||
          (top == "[" && bracket == "]") ||
          (top == "{" && bracket == "}")
          next
      else
          return false
      end
  end

  stack.empty?
end