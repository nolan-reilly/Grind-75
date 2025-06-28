# ------------------------------------------------------------------------------
# Things I Learned From This Problem
# ------------------------------------------------------------------------------
# - You can't check for `list1.val == nil` — `val` won't be `nil` unless it's set.
# - Instead, use `list1.nil?` to check if we've reached the end of the list.
# ------------------------------------------------------------------------------

def merge_two_lists(list1, list2)
  # ----------------------------------------------------------------------------
  # O(n) Solution
  # Idea: Use a dummy head to build a new sorted list.
  # Loop through both lists, append the smaller node each time.
  # ----------------------------------------------------------------------------

  dummy = ListNode.new() # Dummy head used to return
  curr = dummy # Used to build the sorted list

  # Traverse both lists while neither is empty
  until list1.nil? || list2.nil?
    if list1.val < list2.val
      curr.next = list1
      list1 = list1.next
    else
      curr.next = list2
      list2 = list2.next
    end

    curr = curr.next # Move the pointer forward one
  end

  if list1.nil?
      curr.next = list2
  else
      curr.next = list1 
  end

    return dummy.next
end