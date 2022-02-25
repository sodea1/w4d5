require "byebug"
require 'benchmark'
# same letters different order
def first_anagram?(str1, str2)
  ana1 = []

  (0...str1.length).each do |i|
    (i...str1.length).each do |j|
      ana1 << str1[i..j]
    end
  end

  ana1.each do |an|
    return true if an.chars.sort.join == str2.chars.sort.join
  end

  false
end

# take each letter, check its index in str2, return false if you can't find it and if you can, delete arr2 at that index
def second_anagram?(str1, str2)
  # debugger
  arr2 = str2.split("")
  str1.each_char do |char|
    index = arr2.find_index(char) # index of char from first arr
    return false if index.nil? # 
    arr2.delete_at(index)
  end

  if !arr2.empty?
    return false
  end

  true
end

def third_anagram?(str1, str2)
  str1.chars.sort.join == str2.chars.sort.join
end

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char { |char| hash1[char] += 1 }
  str2.each_char { |char| hash2[char] += 1 }

  hash1 == hash2
end

def one_hash_anagrams(str1, str2)
  hash = Hash.new(0)

  (0...str1.length).each do |i|
    hash[str1[i]] += 1
    hash[str2[i]] -= 1
  end

  hash.values.uniq == [0]
end

# p one_hash_anagrams("gizmo", "sally") 
# p one_hash_anagrams("elvis", "lives")

# p third_anagram?("gizmo", "sally") 
# p third_anagram?("elvis", "lives")

# p fourth_anagram?("gizmo", "sally") 
# p fourth_anagram?("elvis", "lives")

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

Benchmark.bm do |x|
  x.report("first_anagram") { first_anagram?("lsakdjflhoijjflsdnjkfashldfhka", "sallkjsahfgljkahlfhladshfjlasdljfhjlasdfy")}
  x.report("second_anagram") { second_anagram?("lsakdjflhoijjflsdnjkfashldfhka", "sallkjsahfgljkahlfhladshfjlasdljfhjlasdfy")}
  x.report("third_anagram") { third_anagram?("lsakdjflhoijjflsdnjkfashldfhka", "sallkjsahfgljkahlfhladshfjlasdljfhjlasdfy")}
  x.report("fourth_anagram") { fourth_anagram?("lsakdjflhoijjflsdnjkfashldfhka", "sallkjsahfgljkahlfhladshfjlasdljfhjlasdfy")}
  x.report("one_hash") { one_hash_anagrams("lsakdjflhoijjflsdnjkfashldfhka", "sallkjsahfgljkahlfhladshfjlasdljfhjlasdfy")}
end