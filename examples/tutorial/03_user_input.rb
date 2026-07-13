# Lesson 3: Getting User Input
# Programs become interactive when they can get input from users

# gets method reads input from the user
puts "What's your name?"
name = gets

puts "Hello, #{name}!"

# Notice there's an extra line? gets includes the Enter key press
# Use chomp to remove it
puts "What's your favorite color?"
color = gets.chomp

puts "#{color} is a great color!"

# You can convert input to different types
puts "How old are you?"
age_string = gets.chomp
age = age_string.to_i  # to_i converts string to integer

puts "In 10 years, you'll be #{age + 10} years old!"

# Shorter way to do the same thing
puts "What's your favorite number?"
number = gets.chomp.to_i

puts "Your number times 2 is #{number * 2}"

# Converting to float (decimal)
puts "Enter a decimal number:"
decimal = gets.chomp.to_f

puts "Your number divided by 2 is #{decimal / 2}"

# Building a simple interactive program
puts "=== Personal Information ==="
puts "Enter your first name:"
first_name = gets.chomp

puts "Enter your last name:"
last_name = gets.chomp

puts "Enter your age:"
age = gets.chomp.to_i

puts "Enter your height in feet (like 5.8):"
height = gets.chomp.to_f

puts "\n=== Your Information ==="
puts "Full name: #{first_name} #{last_name}"
puts "Age: #{age} years old"
puts "Height: #{height} feet"
puts "In 5 years you'll be #{age + 5} years old"

# Exercise:
# 1. Ask the user for their favorite food and restaurant
# 2. Ask for how many times they've eaten there
# 3. Display a summary message

puts "\n=== Food Survey ==="
puts "What's your favorite food?"
favorite_food = gets.chomp

puts "What's your favorite restaurant?"
favorite_restaurant = gets.chomp

puts "How many times have you eaten there?"
times_eaten = gets.chomp.to_i

puts "\nSummary: You love #{favorite_food} and have eaten at #{favorite_restaurant} #{times_eaten} times!" 