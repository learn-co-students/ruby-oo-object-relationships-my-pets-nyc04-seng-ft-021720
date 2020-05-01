class Owner
  attr_reader :name, :species  

  @@all = [] 
  def initialize(name, species="human")
    @name = name 
    @species = species
    @@all << self 
  end

  def self.all 
    @@all 
  end 

  def self.count
    @@all.count  
  end 

  def self.reset_all
    @@all.clear   
  end 

  def say_species 
    @species = "I am a human."
    @species  
  end

  def cats
   Cat.all.select do |meow|
    meow.owner == self 
  end  
  end 

  def dogs
    Dog.all.select do |woof|
     woof.owner == self 
   end  
   end 

   def buy_cat(name)
    Cat.new(name, self)
   end 

   def buy_dog(name)
    Dog.new(name, self)
   end 

   def walk_dogs
    dogs.select do |dog|
    dog.mood = "happy"
    end 
   end


   def feed_cats
    cats.select do |cat|
    cat.mood = "happy"
    end 
   end

   def sell_pets
      pets = dogs + cats 
      pets.select do |all_pets|
        all_pets.mood = "nervous"
        all_pets.owner = nil 
      end 
   end 

   def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
   end
end