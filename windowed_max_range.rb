
# w = size of window
# array of window sizes. find largest difference between two window sizes

def windowed_max_range(array, window_size)
  current_max_range = 0

  array.each.with_index do |wind, i|
    j = i + window_size - 1
    range = array[i..j]
    diff = range.max - range.min
    current_max_range = diff if diff > current_max_range
  end

  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


