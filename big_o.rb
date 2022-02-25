require 'benchmark'
# time complexity: O(n^2)

def my_min(list)

  min = list.first

  list.each do |ele|
    list.each do |ele2|
      if min > ele2
        min = ele2
      end
    end
  end

  min
end

# time complexity: O(n)
def my_min_fast(list)
  min = list.first

  (1...list.length).each do |i|
    if min > list[i] 
      min = list[i]
    end
  end

  min
end


list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# Benchmark.bm do |x|
#    x.report("my_min") { my_min(list) }
#    x.report("my_min_fast") { my_min_fast(list) }
# end

# time complexity = O(n^2)
def largest_contiguous_subsum(list)
  subarrs = []

  (0...list.length).each do |i|
    (i...list.length).each do |j|
      subarrs << list[i..j]
    end
  end

  subarrs.map(&:sum).max
end

def largest_contiguous_subsum_optimized(list)
  larest_sum = 0
  curr_sum = 0

  list.each do |ele|
    curr_sum += ele
    largest_sum = curr_sum if largest_sum < curr_sum
  end

  list.reverse.each do |el|
    curr_sum += el
    largest_sum = curr_sum if largest_sum < curr_sum
  end 

  largest_sum 
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])



