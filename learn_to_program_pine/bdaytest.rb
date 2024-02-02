require 'json'

test_hash = {
  "Joshua Hall" => "Jul 11, 1986",
  "Amy Hall" => "Feb 2, 1984", 
  "Naomi Hall" => "Oct 9, 2014"
}

jhash = test_hash.to_json

filename = "bday_test.txt"

File.open(filename, "w") do |f|
  f.write(jhash)
end
