class Owner
  # code goes here
  attr_reader :name, :species
  attr_accessor :cat, :dog

  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    return "I am a #{species}."
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

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
    self.cats
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
    self.dogs
  end

  def walk_dogs
    self.dogs.select{|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.select{|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.select{|cat| cat.mood = "nervous"}
    self.dogs.select{|dog| dog.mood = "nervous"}
    self.cats.select{|cat| cat.owner = nil}
    self.dogs.select{|dog| dog.owner = nil}
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end