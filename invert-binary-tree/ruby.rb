# ------------------------------------------------------------------------------
# Things I Learned From This Problem
# ------------------------------------------------------------------------------
# - Practiced recursion and how depth-first search (DFS) can be used for tree traversal.
# ------------------------------------------------------------------------------

def invert_tree(root)
  # ----------------------------------------------------------------------------
  # Recursive DFS Solution
  # Idea: At each node, swap the left and right subtrees.
  # Use DFS to continue this process down the tree recursively.
  #
  # Base Case: If root is nil, return nil.
  # Recursive Case:
  #   1. Swap left and right children.
  #   2. Recur on left and right children.
  # ----------------------------------------------------------------------------

  return nil if root.nil?

  # Swap left and right children
  temp = root.left
  root.left = root.right
  root.right = temp

  # Recursively invert children
  invert_tree(root.left)
  invert_tree(root.right)

  root
end