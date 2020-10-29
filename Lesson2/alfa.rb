ara = Hash[(:a..:z).to_a.zip((1..26).to_a)]
glasn = ara.select {|k,v|
  k == :a || k ==:e || k ==:i || k ==:o || k ==:u || k ==:y
}
puts glasn
