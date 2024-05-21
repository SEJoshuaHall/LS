def pangram?(string)
  alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  alpha_hsh = alphabet.to_h {|e| [e, false]}
  string.chars.each do |char|
    alpha_hsh[char] = true
  end
  alpha_hsh.values.all?
end

p pangram?("The quick brown fox jumps over the lazy dog.")
p pangram?("This is not a pangram.")