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

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true