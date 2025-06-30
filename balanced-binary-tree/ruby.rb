# ------------------------------------------------------------------------------
# Things Learned From This Problem
# ------------------------------------------------------------------------------
# - Learned how to calculate the height of a binary tree using recursion
# - Learned that instance variables (like @balanced) persist across function calls
# - Learned about the scope of Ruby variables and how closures can be used
# ------------------------------------------------------------------------------

def is_balanced(root)
  # ----------------------------------------------------------------------------
  # O(n) Solution
  #
  # Approach:
  # - Recursively check the height of left and right subtrees
  # - If any subtree is imbalanced, set a shared flag to false
  #
  # Tree Height Logic:
  # - For any node, height = 1 + max(height of left, height of right)
  # ----------------------------------------------------------------------------

  # Shared variable to track if any imbalance was found
  @balanced = [true]

  def height(node)
    return 0 if node.nil?  # Base case: null node has height 0

    left = height(node.left)
    right = height(node.right)

    # If height difference exceeds 1, it's not balanced
    if (left - right).abs > 1
      @balanced[0] = false
    end

    return 1 + [left, right].max
  end

  height(root)
  @balanced[0]
end