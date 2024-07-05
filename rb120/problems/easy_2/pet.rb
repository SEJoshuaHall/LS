class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_accessor :number_of_pets
  attr_reader :name

  def initialize(name)
    @name = name
    @number_of_pets = 0
  end

  def to_s
    name
  end
end

class Shelter  
  def initialize
    @adoptions = {}
  end
  
  def print_adoptions
    adoptions.each_pair do |owner, pets|
      puts "#{owner} has adopted the following pets:"
      pets.each do |pet_sub_array|
        puts "a #{pet_sub_array[0]} named #{pet_sub_array[1]}"
      end
      puts ''
    end
  end
  
  def adopt(owner, pet) #need to increase number of pets for owner
    @owner = owner
    @pet = pet
    if adoptions.keys.include?(owner)
      adoptions[owner] << [@pet.type, @pet.name]
    else
      adoptions[owner] = [[@pet.type, @pet.name]]
    end
    owner.number_of_pets += 1
  end

  private

  attr_accessor :adoptions
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."