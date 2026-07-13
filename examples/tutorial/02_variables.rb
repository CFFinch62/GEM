# Lesson 2: Variables and Data Types
# Variables are like containers that store information

# Creating variables with different types of data
name = "Alice"           # String (text)
age = 25                 # Integer (whole number)
height = 5.6             # Float (decimal number)
is_student = true        # Boolean (true or false)

# Printing variables
puts "Name: #{name}"
puts "Age: #{age}"
puts "Height: #{height} feet"
puts "Is student: #{is_student}"

# The #{} syntax is called string interpolation
# It lets you put variables inside strings

# You can also concatenate (join) strings with +
puts "Hello, " + name + "!"

# Variables can be changed
age = 26
puts "Next year I'll be #{age}"

# Different data types
favorite_number = 42
pi = 3.14159
greeting = "Hello there!"
is_raining = false

puts "My favorite number is #{favorite_number}"
puts "Pi is approximately #{pi}"
puts greeting
puts "Is it raining? #{is_raining}"

# Ruby is dynamically typed - variables can change type
my_variable = "I'm a string"
puts my_variable

my_variable = 100
puts "Now I'm a number: #{my_variable}"

my_variable = true
puts "Now I'm a boolean: #{my_variable}"

# Exercise:
# 1. Create variables for your favorite color, movie, and number
# 2. Print them using string interpolation
# 3. Try changing one of the variables and print it again

favorite_color = "blue"
favorite_movie = "The Matrix"
lucky_number = 7

puts "My favorite color is #{favorite_color}"
puts "My favorite movie is #{favorite_movie}"
puts "My lucky number is #{lucky_number}" 