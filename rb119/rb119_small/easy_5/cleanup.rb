def cleanup(str)
  str.gsub(/\W/, ' ').gsub(/\s+/, " ")
end

p cleanup("---what's my +*& line?") == ' what s my line '