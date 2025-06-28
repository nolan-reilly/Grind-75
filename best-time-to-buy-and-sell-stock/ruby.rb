# ------------------------------------------------------------------------------
# Things I Learned From This Problem
# ------------------------------------------------------------------------------
# - `each_with_index` nested loops require manual bounds, but Ruby’s range-based
#   `for` loops or single-pass solutions can avoid awkward index checks.
# ------------------------------------------------------------------------------

def max_profit(prices)
  # ----------------------------------------------------------------------------
  # Optimized O(n) Solution
  # Idea: Track the lowest buy price so far, and compute profit at each step.
  # Update max_profit whenever we find a better sale.
  # ----------------------------------------------------------------------------

  max_profit = 0
  buy = prices[0] # We always want to buy on the first day

  prices.each do |price|
    if price < buy
      buy = price
      next
    end

    profit = price - buy
    max_profit = profit if profit > max_profit
  end

  max_profit

  # ----------------------------------------------------------------------------
  # Brute Force O(n^2) Solution
  # Idea: Compare every possible pair (i < j) to find max profit
  # ----------------------------------------------------------------------------

  # max_profit = 0

  # I know this is not the standard way to do loops in Ruby but this is
  # one of the easiest ways to get the logic we're going for
  # for i in 0...prices.length
  #     for j in (i+1)...prices.length
  #         profit = prices[j] - prices[i]
  #         if profit > max_profit
  #             max_profit = profit
  #         end
  #     end
  # end

  # prices.each_with_index do |price1, idx1|
  #     prices.each_with_index do |price2, idx2|
  #         next if idx2 < idx1

  #         profit = price2 - price1
  #         if profit > max_profit
  #             max_profit = profit
  #         end
  #     end
  # end

  # max_profit
end