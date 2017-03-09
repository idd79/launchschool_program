# Exercise 120-Lesson 5. Easy 2
# See pets_shelter.rb for another solution

class Pet
  attr_reader :type, :name, :status

  def initialize(type, name, status = 'unadopted')
    @type = type
    @name = name
    @status = status
  end

  def change_status(new_status)
    @status = new_status
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.count
  end
end

class Shelter
  def adopt(owner, pet)
    if pet.status == 'adopted'
      puts "#{pet.name} has been adopted already!"
      return
    end
    owner.pets << pet
    pet.change_status('adopted')
  end

  def print_adoptions
    ObjectSpace.each_object(Owner) do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.pets.each { |pet| puts "a #{pet.type} named #{pet.name}" }
      puts ''
    end
  end

  def print_unadopted
    puts "The Animal Shelter has the following unadopted pets:"
    ObjectSpace.each_object(Pet) do |pet|
      puts "a #{pet.type} named #{pet.name}" if pet.status == 'unadopted'
    end
    puts ''
  end

  def number_of_unadopted
    count = 0
    ObjectSpace.each_object(Pet) do |pet|
      count += 1 if pet.status == 'unadopted'
    end
    count
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

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

shelter.print_unadopted
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "The Animal Shelter has #{shelter.number_of_unadopted} pets."
