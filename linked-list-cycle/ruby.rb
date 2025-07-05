# ------------------------------------------------------------------------------
# Things I Learned From This Problem
# ------------------------------------------------------------------------------
# - You can use a `Set` to track visited nodes and detect cycles in O(n) time.
# - Floyd's Cycle Detection (Tortoise and Hare) is a clever O(1) space solution.
# - Comparing node *references* (not values) is key in cycle detection.
# ------------------------------------------------------------------------------

def hasCycle(head)
  # ----------------------------------------------------------------------------
  # Approach 1: Using a Set to track visited nodes
  # Idea: As we traverse, if we revisit a node (same object), there is a cycle.
  # ----------------------------------------------------------------------------

  set = Set.new

  # Keep traversing until the end of the list
  while head
    # If we've already seen this node, it's a cycle
    return true if set.include?(head)

    set.add(head) # Mark this node as visited
    head = head.next # Move to next node
  end

  false # No cycle found
end

def hasCycle(head)
  # ----------------------------------------------------------------------------
  # Approach 2: Floyd’s Tortoise and Hare (Two Pointers)
  # Idea: Use slow and fast pointers; if they meet, there is a cycle.
  # ----------------------------------------------------------------------------

  slow = head
  fast = head

  # Fast moves two steps, slow moves one step
  while fast && fast.next
    slow = slow.next
    fast = fast.next.next

    # If they meet, we're in a cycle
    return true if slow == fast
  end

  false # Fast pointer hit the end
end