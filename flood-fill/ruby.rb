# ------------------------------------------------------------------------------
# Things Learned From This Problem
# ------------------------------------------------------------------------------
# - DFS (Depth-First Search) can be applied to 2D arrays, not just trees/graphs.
# - Importance of checking bounds and values to prevent infinite recursion.
# ------------------------------------------------------------------------------

def flood_fill(image, sr, sc, color)
  # ----------------------------------------------------------------------------
  # O(m * n) DFS Solution
  # - Traverse the image starting from (sr, sc).
  # - Replace any connected cell with the same value as the starting cell
  #   with the given color.
  # - Avoid re-coloring if the starting pixel already has the target color.
  # - Recursively check all 4 directions (up, down, left, right).
  # ----------------------------------------------------------------------------

  start_val = image[sr][sc]
  return image if start_val == color  # Avoid infinite loop if color is same

  def dfs(image, sr, sc, start_val, color)
    # Check bounds
    return if sr < 0 || sr >= image.length || sc < 0 || sc >= image[0].length

    # Skip if this cell is not the starting value
    return if image[sr][sc] != start_val

    # Fill this cell with the new color
    image[sr][sc] = color

    # Recurse in all 4 directions
    dfs(image, sr - 1, sc, start_val, color) # Up
    dfs(image, sr + 1, sc, start_val, color) # Down
    dfs(image, sr, sc - 1, start_val, color) # Left
    dfs(image, sr, sc + 1, start_val, color) # Right
  end

  dfs(image, sr, sc, start_val, color)
  image
end