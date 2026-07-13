# Lesson 9: Methods - Organizing Code into Functions
# Methods let you group code into reusable blocks

puts "=== Basic Methods ==="
# Defining a simple method
def say_hello
  puts "Hello, World!"
end

# Calling the method
say_hello

# Method with parameters
def greet(name)
  puts "Hello, #{name}!"
end

greet("Alice")
greet("Bob")

# Method with multiple parameters
def introduce(name, age, city)
  puts "Hi, I'm #{name}. I'm #{age} years old and I live in #{city}."
end

introduce("Charlie", 25, "New York")

puts "\n=== Methods with Return Values ==="
# Methods that return values
def add(a, b)
  return a + b
end

result = add(5, 3)
puts "5 + 3 = #{result}"

# Ruby returns the last expression automatically
def multiply(a, b)
  a * b  # No need for 'return'
end

puts "4 * 6 = #{multiply(4, 6)}"

# Method that returns different types
def get_grade(score)
  if score >= 90
    "A"
  elsif score >= 80
    "B"
  elsif score >= 70
    "C"
  elsif score >= 60
    "D"
  else
    "F"
  end
end

puts "Score 85 gets grade: #{get_grade(85)}"
puts "Score 72 gets grade: #{get_grade(72)}"

puts "\n=== Default Parameters ==="
# Methods with default parameter values
def greet_with_title(name, title = "Mr./Ms.")
  puts "Hello, #{title} #{name}!"
end

greet_with_title("Smith")  # Uses default title
greet_with_title("Johnson", "Dr.")  # Uses provided title

# Multiple default parameters
def create_user(name, age = 18, country = "USA")
  puts "User: #{name}, Age: #{age}, Country: #{country}"
end

create_user("Alice")
create_user("Bob", 25)
create_user("Charlie", 30, "Canada")

puts "\n=== Variable Number of Arguments ==="
# Methods that accept any number of arguments
def sum_all(*numbers)
  total = 0
  numbers.each { |num| total += num }
  total
end

puts "Sum of 1,2,3: #{sum_all(1, 2, 3)}"
puts "Sum of 10,20,30,40: #{sum_all(10, 20, 30, 40)}"

# Method with required and optional arguments
def describe_person(name, *hobbies)
  puts "#{name}'s hobbies:"
  if hobbies.empty?
    puts "  No hobbies listed"
  else
    hobbies.each { |hobby| puts "  - #{hobby}" }
  end
end

describe_person("Alice")
describe_person("Bob", "reading", "swimming", "cooking")

puts "\n=== Local vs Global Variables ==="
# Global variable (avoid using these)
$global_var = "I'm global"

# Local variable in method
def test_variables
  local_var = "I'm local"
  puts "Inside method: #{local_var}"
  puts "Inside method: #{$global_var}"
end

test_variables
puts "Outside method: #{$global_var}"
# puts local_var  # This would cause an error

puts "\n=== Useful Method Examples ==="
# Temperature converter
def celsius_to_fahrenheit(celsius)
  (celsius * 9.0 / 5.0) + 32
end

def fahrenheit_to_celsius(fahrenheit)
  (fahrenheit - 32) * 5.0 / 9.0
end

puts "25°C = #{celsius_to_fahrenheit(25).round(1)}°F"
puts "77°F = #{fahrenheit_to_celsius(77).round(1)}°C"

# String utilities
def reverse_words(sentence)
  sentence.split.reverse.join(" ")
end

def count_vowels(text)
  vowels = "aeiouAEIOU"
  count = 0
  text.each_char { |char| count += 1 if vowels.include?(char) }
  count
end

def capitalize_words(sentence)
  sentence.split.map(&:capitalize).join(" ")
end

test_sentence = "hello world ruby programming"
puts "Original: #{test_sentence}"
puts "Reversed words: #{reverse_words(test_sentence)}"
puts "Vowel count: #{count_vowels(test_sentence)}"
puts "Capitalized: #{capitalize_words(test_sentence)}"

# Math utilities
def is_even(number)
  number % 2 == 0
end

def is_prime(number)
  return false if number < 2
  (2..Math.sqrt(number)).none? { |i| number % i == 0 }
end

def factorial(n)
  return 1 if n <= 1
  n * factorial(n - 1)  # Recursive method
end

puts "\n=== Number Analysis ==="
test_numbers = [2, 3, 4, 5, 6, 7, 8, 9, 10]
test_numbers.each do |num|
  even_odd = is_even(num) ? "even" : "odd"
  prime_status = is_prime(num) ? "prime" : "not prime"
  puts "#{num}: #{even_odd}, #{prime_status}"
end

puts "5! = #{factorial(5)}"

puts "\n=== Interactive Calculator ==="
def calculate(operation, a, b)
  case operation.downcase
  when "add", "+"
    a + b
  when "subtract", "-"
    a - b
  when "multiply", "*"
    a * b
  when "divide", "/"
    return "Cannot divide by zero" if b == 0
    a.to_f / b
  when "power", "**"
    a ** b
  else
    "Unknown operation"
  end
end

# Interactive calculator loop
puts "Simple Calculator"
puts "Operations: add, subtract, multiply, divide, power"
puts "Type 'quit' to exit"

loop do
  puts "\nEnter operation:"
  operation = gets.chomp
  break if operation.downcase == "quit"
  
  puts "Enter first number:"
  num1 = gets.chomp.to_f
  
  puts "Enter second number:"
  num2 = gets.chomp.to_f
  
  result = calculate(operation, num1, num2)
  puts "Result: #{result}"
end

puts "\n=== Password Validator ==="
def validate_password(password)
  errors = []
  
  errors << "Must be at least 8 characters long" if password.length < 8
  errors << "Must contain at least one uppercase letter" unless password.match?(/[A-Z]/)
  errors << "Must contain at least one lowercase letter" unless password.match?(/[a-z]/)
  errors << "Must contain at least one number" unless password.match?(/[0-9]/)
  errors << "Must contain at least one special character" unless password.match?(/[!@#$%^&*]/)
  
  if errors.empty?
    "Password is valid!"
  else
    "Password errors:\n" + errors.map { |error| "- #{error}" }.join("\n")
  end
end

# Test passwords
test_passwords = ["weak", "StrongPass1!", "noUpper123!", "NOLOWER123!", "NoNumbers!"]
test_passwords.each do |password|
  puts "\nTesting password: '#{password}'"
  puts validate_password(password)
end

puts "\n=== Array Helper Methods ==="
def find_max(array)
  return nil if array.empty?
  max = array[0]
  array.each { |num| max = num if num > max }
  max
end

def find_min(array)
  return nil if array.empty?
  min = array[0]
  array.each { |num| min = num if num < min }
  min
end

def calculate_average(array)
  return 0 if array.empty?
  array.sum.to_f / array.length
end

def remove_duplicates(array)
  unique = []
  array.each { |item| unique << item unless unique.include?(item) }
  unique
end

# Test array methods
numbers = [3, 7, 2, 9, 1, 5, 7, 3, 8]
puts "Numbers: #{numbers}"
puts "Max: #{find_max(numbers)}"
puts "Min: #{find_min(numbers)}"
puts "Average: #{calculate_average(numbers).round(2)}"
puts "Without duplicates: #{remove_duplicates(numbers)}" 