def short_long_short(str1, str2)
  str1.length > str2.length ? (long, short = str1, str2) : (short, long = str1, str2)
  short + long + short
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"