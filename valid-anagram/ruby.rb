# ------------------------------------------------------------------------------
# Things I Learned From This Problem
# ------------------------------------------------------------------------------
# - Practiced using `.split`, `.chars`, and hash maps for counting character frequency
# - Learned about the '.fetch' function for building hashes as well
# ------------------------------------------------------------------------------

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  # ----------------------------------------------------------------------------
  # O(n) Hashmap Solution
  # Idea: Count frequency of each character in both strings and compare.
  # Early return if lengths don't match (guaranteed not an anagram).
  # ----------------------------------------------------------------------------

  return false if s.length != t.length

  s_hash = {}
  t_hash = {}

  s.chars.each do |c|
    s_hash[c] = s_hash.fetch(c, 0) + 1
  end

  t.chars.each do |c|
    t_hash[c] = t_hash.fetch(c, 0) + 1
  end

  s_hash == t_hash
end

# ------------------------------------------------------------------------------
# Alternate Brute Force Solution (O(n log n))
# Idea: Sort both strings and compare
# ------------------------------------------------------------------------------
#
# def is_anagram(s, t)
#   s.split("").sort == t.split("").sort
# end