# Lesson 5: Conditional Statements (if/else)
# Conditionals let your program make decisions

# Basic if statement
age = 18

if age >= 18
  puts "You are an adult!"
end

# if/else statement
temperature = 75

if temperature > 80
  puts "It's hot outside!"
else
  puts "It's not too hot."
end

# if/elsif/else statement
score = 85

if score >= 90
  puts "Grade: A"
elsif score >= 80
  puts "Grade: B"
elsif score >= 70
  puts "Grade: C"
elsif score >= 60
  puts "Grade: D"
else
  puts "Grade: F"
end

puts "\n=== Comparison Operators ==="
# Comparison operators
a = 10
b = 5

puts "a = #{a}, b = #{b}"
puts "a == b: #{a == b}"    # Equal to
puts "a != b: #{a != b}"    # Not equal to
puts "a > b: #{a > b}"      # Greater than
puts "a < b: #{a < b}"      # Less than
puts "a >= b: #{a >= b}"    # Greater than or equal
puts "a <= b: #{a <= b}"    # Less than or equal

puts "\n=== Logical Operators ==="
# Logical operators
sunny = true
warm = true
cold = false

puts "sunny = #{sunny}, warm = #{warm}, cold = #{cold}"
puts "sunny && warm: #{sunny && warm}"    # AND
puts "sunny || cold: #{sunny || cold}"    # OR
puts "!cold: #{!cold}"                    # NOT

# Combining conditions
if sunny && warm
  puts "Perfect day for a picnic!"
elsif sunny && !warm
  puts "Sunny but chilly - bring a jacket!"
elsif !sunny && warm
  puts "Warm but cloudy."
else
  puts "Not great weather today."
end

puts "\n=== Interactive Examples ==="
# Interactive age checker
puts "Enter your age:"
user_age = gets.chomp.to_i

if user_age < 13
  puts "You're a kid!"
elsif user_age < 20
  puts "You're a teenager!"
elsif user_age < 65
  puts "You're an adult!"
else
  puts "You're a senior!"
end

# Password checker
puts "\nEnter the password:"
password = gets.chomp

if password == "secret123"
  puts "Access granted!"
else
  puts "Access denied!"
end

# Number guessing game
secret_number = 7
puts "\nGuess a number between 1 and 10:"
guess = gets.chomp.to_i

if guess == secret_number
  puts "Correct! You guessed it!"
elsif guess < secret_number
  puts "Too low! The number was #{secret_number}"
else
  puts "Too high! The number was #{secret_number}"
end

puts "\n=== Unless Statement ==="
# unless is the opposite of if
raining = false

unless raining
  puts "Let's go for a walk!"
end

# This is the same as:
if !raining
  puts "Let's go for a walk! (using if)"
end

puts "\n=== Case Statement ==="
# Case statement (like switch in other languages)
puts "Enter a day of the week (1-7):"
day = gets.chomp.to_i

case day
when 1
  puts "Monday - Start of the work week"
when 2
  puts "Tuesday - Getting into the groove"
when 3
  puts "Wednesday - Hump day!"
when 4
  puts "Thursday - Almost there"
when 5
  puts "Friday - TGIF!"
when 6, 7
  puts "Weekend - Time to relax!"
else
  puts "Invalid day number"
end

# Exercise: Simple Calculator with Conditions
puts "\n=== Calculator Exercise ==="
puts "Enter first number:"
num1 = gets.chomp.to_f

puts "Enter operation (+, -, *, /):"
operation = gets.chomp

puts "Enter second number:"
num2 = gets.chomp.to_f

case operation
when "+"
  result = num1 + num2
  puts "#{num1} + #{num2} = #{result}"
when "-"
  result = num1 - num2
  puts "#{num1} - #{num2} = #{result}"
when "*"
  result = num1 * num2
  puts "#{num1} * #{num2} = #{result}"
when "/"
  if num2 != 0
    result = num1 / num2
    puts "#{num1} / #{num2} = #{result}"
  else
    puts "Error: Cannot divide by zero!"
  end
else
  puts "Invalid operation!"
end 