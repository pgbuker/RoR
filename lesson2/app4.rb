arr = ("a".."z").to_a
arr_vowel = ["a", "e", "i", "o", "u"]
vowels = {} 
arr.each_with_index { |letter, index| arr_vowel.each {|vowel| vowels[letter] = index + 1 if vowel == letter }} 
puts vowels   
