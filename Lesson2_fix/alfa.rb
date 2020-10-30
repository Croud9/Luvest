alphabet = Hash[(:a..:z).to_a.zip((1..26).to_a)]
vowels = alphabet.select { |letter, position|
  letter == :a || letter ==:e || letter ==:i || letter ==:o || letter ==:u || letter ==:y
}
puts vowels
