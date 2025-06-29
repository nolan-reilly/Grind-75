# ------------------------------------------------------------------------------
# Things Learned From This Problem
# ------------------------------------------------------------------------------
# - Sometimes it's more helpful to think about the logic visually than to jump
#   straight into code.
# - Ruby's method/local variable scope doesn't allow outer access (important when
#   returning from recursive or loop logic).
# ------------------------------------------------------------------------------

def lowest_common_ancestor(root, p, q)
  # ----------------------------------------------------------------------------
  # O(log n) - O(n) Time | O(1) Space (excluding recursion stack)
  #
  # Logic:
  # - In a BST, if both p and q are smaller than the current node, move left.
  # - If both p and q are greater, move right.
  # - The moment they split (i.e., one goes left and one goes right) or either
  #   equals the current node, that's the LCA.
  # ----------------------------------------------------------------------------

  curr = root

  unless curr?
    if p.val < curr.val && q.val < curr.val
      curr = curr.left
    elsif p.val > curr.val && q.val > curr.val
      curr = curr.right
    else
      return curr
    end
  end
end