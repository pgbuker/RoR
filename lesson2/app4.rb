arr = ("a".."z").to_a
vowel = {}
arr.each_with_index do |letter, index|
  case letter
  when "a"
    vowel[letter] = index + 1
  when "e"
    vowel[letter] = index + 1

  when "i"
    vowel[letter] = index + 1

  when "o"
    vowel[letter] = index + 1

  when "u"
    vowel[letter] = index + 1
  end
end  
puts vowel   
