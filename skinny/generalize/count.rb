# ============================================ #
# ================== DRY ===================== #
# ============================================ #

# how many orders you have that has a total amount larger than $100
def expensive_orders_count
  self.orders.count { |order| order.total > 10000 }
end

# how many people you have referred have made their first orders.
def success_refers_count
  self.refers.count { |refer| refer.orders.count > 0 }
end

# array helper
class Array
  def count block # &block
    counter = 0
    self.each { |a| counter ++ if block a  } # self.each { |a| counter += 1 if block.call(a) }
    counter
  end
end

# ============================================ #
# ================== WET ===================== #
# ============================================ #

# how many orders you have that has a total amount larger than $100
def expensive_orders_count
  counter = 0
  self.orders.each { |order| counter += 1 if order.total > 10000 }
  counter
end

# how many people you have referred have made their first orders.
def success_refers_count
  counter = 0
  self.refers.count { |refer|  counter += 1 if refer.orders.count > 0 }
  counter
end
