require "byebug"
require "benchmark"
def bad_two_sum?(arr, target)

  (0...arr.length).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
    end
  end

  false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target) # [0, 1, 5, 7], 6
  sorted = arr.sort

  sorted.each do |ele|
    new_target = ele - target
    return true if bsearch(sorted, new_target)
  end

  false
end

def bsearch(arr, target)
  return nil if arr.empty?
  mid = arr.length / 2

  case arr[mid] <=> target
  when 0
    return mid
  when 1 
    bsearch(arr[0...mid], target)
  when -1
    result = bsearch(arr[mid + 1..-1], target)
    result + mid + 1 if !result.nil?
  end

end

p okay_two_sum?([0, 1, 5, 7], 10)

def two_sum?(arr, target)
  # build a hash out of each n eles in arr
  hash = Hash.new(0)
  # debugger
  # arr.each { |ele| hash[ele] += (target - ele) if ele != 0 }

  arr.each do |ele|
    return true if ele == target
    diff = (ele - target).abs # difference were looking for in the hash keys
    hash[ele] = diff
    return true if hash.has_key?(diff) && ele != diff
  end

  # hash.each do |k, v|
  #   return true if hash.has_key?(v) && k != v
  # end

  false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

Benchmark.bm do |x|
   x.report("w/bsearch") { okay_two_sum?(arr, 10) }
   x.report("2sum w/hash") { two_sum?(arr, 10) }
end


