pets = {'cat' => 8, 'parrot' => 5, 'dog' => 3, 'fish' => 1}

pets.reject do |pet, age|
  age < 4
end

p pets