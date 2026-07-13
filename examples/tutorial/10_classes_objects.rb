# Lesson 10: Classes and Objects - Object-Oriented Programming
# Classes are blueprints for creating objects

puts "=== Basic Class Definition ==="
# Defining a simple class
class Person
  # Constructor method - runs when creating a new object
  def initialize(name, age)
    @name = name  # Instance variable (belongs to each object)
    @age = age
  end
  
  # Instance methods
  def introduce
    puts "Hi, I'm #{@name} and I'm #{@age} years old."
  end
  
  def have_birthday
    @age += 1
    puts "Happy birthday! #{@name} is now #{@age} years old."
  end
end

# Creating objects (instances of the class)
person1 = Person.new("Alice", 25)
person2 = Person.new("Bob", 30)

# Calling methods on objects
person1.introduce
person2.introduce

person1.have_birthday

puts "\n=== Getter and Setter Methods ==="
class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end
  
  # Getter methods (read access to instance variables)
  def name
    @name
  end
  
  def grade
    @grade
  end
  
  # Setter methods (write access to instance variables)
  def name=(new_name)
    @name = new_name
  end
  
  def grade=(new_grade)
    if new_grade >= 0 && new_grade <= 100
      @grade = new_grade
    else
      puts "Grade must be between 0 and 100"
    end
  end
  
  def display_info
    puts "Student: #{@name}, Grade: #{@grade}%"
  end
end

student = Student.new("Charlie", 85)
student.display_info

# Using getter methods
puts "Student name: #{student.name}"
puts "Student grade: #{student.grade}"

# Using setter methods
student.name = "Charles"
student.grade = 90
student.display_info

puts "\n=== attr_accessor, attr_reader, attr_writer ==="
# Ruby provides shortcuts for creating getter/setter methods
class Book
  # attr_reader creates getter methods
  attr_reader :title, :author
  
  # attr_writer creates setter methods
  attr_writer :price
  
  # attr_accessor creates both getter and setter methods
  attr_accessor :pages, :genre
  
  def initialize(title, author, pages)
    @title = title
    @author = author
    @pages = pages
    @price = 0
  end
  
  def description
    "#{@title} by #{@author} (#{@pages} pages)"
  end
  
  def set_price(price)
    @price = price if price > 0
  end
  
  def display_price
    puts "Price: $#{@price}"
  end
end

book = Book.new("Ruby Programming", "Matz", 300)
puts book.description

# Using attr_accessor
book.genre = "Programming"
puts "Genre: #{book.genre}"

book.pages = 350
puts "Updated pages: #{book.pages}"

puts "\n=== Class Variables and Methods ==="
class Car
  # Class variable (shared by all instances)
  @@total_cars = 0
  
  attr_accessor :make, :model, :year
  
  def initialize(make, model, year)
    @make = make
    @model = model
    @year = year
    @@total_cars += 1  # Increment when new car is created
  end
  
  def description
    "#{@year} #{@make} #{@model}"
  end
  
  # Class method (called on the class, not on instances)
  def self.total_cars
    @@total_cars
  end
  
  # Another class method
  def self.car_info
    puts "This is the Car class. Total cars created: #{@@total_cars}"
  end
end

# Creating car objects
car1 = Car.new("Toyota", "Camry", 2020)
car2 = Car.new("Honda", "Civic", 2021)
car3 = Car.new("Ford", "Mustang", 2022)

puts car1.description
puts car2.description
puts car3.description

# Calling class methods
puts "Total cars: #{Car.total_cars}"
Car.car_info

puts "\n=== Inheritance ==="
# Base class (parent class)
class Animal
  attr_accessor :name, :age
  
  def initialize(name, age)
    @name = name
    @age = age
  end
  
  def eat
    puts "#{@name} is eating."
  end
  
  def sleep
    puts "#{@name} is sleeping."
  end
  
  def make_sound
    puts "#{@name} makes a sound."
  end
end

# Derived class (child class) inherits from Animal
class Dog < Animal
  attr_accessor :breed
  
  def initialize(name, age, breed)
    super(name, age)  # Call parent constructor
    @breed = breed
  end
  
  # Override parent method
  def make_sound
    puts "#{@name} barks: Woof! Woof!"
  end
  
  # New method specific to Dog
  def fetch
    puts "#{@name} fetches the ball!"
  end
end

class Cat < Animal
  def initialize(name, age)
    super(name, age)
  end
  
  # Override parent method
  def make_sound
    puts "#{@name} meows: Meow!"
  end
  
  # New method specific to Cat
  def climb
    puts "#{@name} climbs the tree!"
  end
end

# Using inheritance
dog = Dog.new("Buddy", 3, "Golden Retriever")
cat = Cat.new("Whiskers", 2)

dog.eat          # Inherited method
dog.make_sound   # Overridden method
dog.fetch        # Dog-specific method

cat.sleep        # Inherited method
cat.make_sound   # Overridden method
cat.climb        # Cat-specific method

puts "\n=== Practical Example: Bank Account ==="
class BankAccount
  attr_reader :account_number, :balance, :owner
  
  # Class variable to track total accounts
  @@total_accounts = 0
  
  def initialize(owner, initial_balance = 0)
    @owner = owner
    @balance = initial_balance
    @account_number = generate_account_number
    @@total_accounts += 1
  end
  
  def deposit(amount)
    if amount > 0
      @balance += amount
      puts "Deposited $#{amount}. New balance: $#{@balance}"
    else
      puts "Deposit amount must be positive"
    end
  end
  
  def withdraw(amount)
    if amount > 0 && amount <= @balance
      @balance -= amount
      puts "Withdrew $#{amount}. New balance: $#{@balance}"
    elsif amount > @balance
      puts "Insufficient funds. Current balance: $#{@balance}"
    else
      puts "Withdrawal amount must be positive"
    end
  end
  
  def transfer(amount, target_account)
    if amount > 0 && amount <= @balance
      @balance -= amount
      target_account.receive_transfer(amount, self)
      puts "Transferred $#{amount} to #{target_account.owner}"
    else
      puts "Transfer failed. Check amount and balance."
    end
  end
  
  def receive_transfer(amount, from_account)
    @balance += amount
    puts "Received $#{amount} from #{from_account.owner}. New balance: $#{@balance}"
  end
  
  def display_info
    puts "Account: #{@account_number}"
    puts "Owner: #{@owner}"
    puts "Balance: $#{@balance}"
  end
  
  def self.total_accounts
    @@total_accounts
  end
  
  private  # Methods below this are private (can't be called from outside)
  
  def generate_account_number
    "ACC" + rand(100000..999999).to_s
  end
end

# Using the BankAccount class
account1 = BankAccount.new("Alice", 1000)
account2 = BankAccount.new("Bob", 500)

account1.display_info
account2.display_info

account1.deposit(200)
account1.withdraw(150)
account1.transfer(100, account2)

puts "\nTotal bank accounts created: #{BankAccount.total_accounts}"

puts "\n=== Practical Example: Simple Game Character ==="
class GameCharacter
  attr_accessor :name, :health, :level
  attr_reader :max_health, :experience
  
  def initialize(name)
    @name = name
    @level = 1
    @max_health = 100
    @health = @max_health
    @experience = 0
  end
  
  def attack(target)
    damage = rand(10..20) + (@level * 2)
    puts "#{@name} attacks #{target.name} for #{damage} damage!"
    target.take_damage(damage)
  end
  
  def take_damage(damage)
    @health -= damage
    @health = 0 if @health < 0
    
    if @health > 0
      puts "#{@name} takes #{damage} damage. Health: #{@health}/#{@max_health}"
    else
      puts "#{@name} has been defeated!"
    end
  end
  
  def heal(amount = 20)
    old_health = @health
    @health += amount
    @health = @max_health if @health > @max_health
    
    healed = @health - old_health
    puts "#{@name} heals for #{healed} points. Health: #{@health}/#{@max_health}"
  end
  
  def gain_experience(exp)
    @experience += exp
    puts "#{@name} gains #{exp} experience points!"
    
    # Level up if enough experience
    if @experience >= (@level * 100)
      level_up
    end
  end
  
  def level_up
    @level += 1
    @max_health += 20
    @health = @max_health  # Full heal on level up
    puts "#{@name} levels up! Now level #{@level}. Max health: #{@max_health}"
  end
  
  def status
    puts "#{@name} - Level #{@level}"
    puts "Health: #{@health}/#{@max_health}"
    puts "Experience: #{@experience}/#{@level * 100}"
  end
  
  def alive?
    @health > 0
  end
end

# Game simulation
hero = GameCharacter.new("Hero")
monster = GameCharacter.new("Goblin")

puts "=== Battle Simulation ==="
hero.status
monster.status

puts "\n--- Battle begins! ---"
while hero.alive? && monster.alive?
  # Hero attacks
  hero.attack(monster)
  break unless monster.alive?
  
  # Monster attacks
  monster.attack(hero)
  break unless hero.alive?
  
  puts "---"
end

if hero.alive?
  puts "#{hero.name} wins!"
  hero.gain_experience(50)
  hero.status
else
  puts "#{monster.name} wins!"
end 