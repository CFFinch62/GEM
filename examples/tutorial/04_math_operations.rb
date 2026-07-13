# Lesson 4: Math Operations and Calculations
# Ruby can perform all kinds of mathematical operations

# Basic arithmetic operators
a = 10
b = 3

puts "a = #{a}, b = #{b}"
puts "Addition: #{a} + #{b} = #{a + b}"
puts "Subtraction: #{a} - #{b} = #{a - b}"
puts "Multiplication: #{a} * #{b} = #{a * b}"
puts "Division: #{a} / #{b} = #{a / b}"
puts "Modulo (remainder): #{a} % #{b} = #{a % b}"
puts "Exponentiation: #{a} ** #{b} = #{a ** b}"

puts "\n=== Integer vs Float Division ==="
# Integer division vs float division
puts "10 / 3 = #{10 / 3}"           # Integer division
puts "10.0 / 3 = #{10.0 / 3}"       # Float division
puts "10 / 3.0 = #{10 / 3.0}"       # Float division

puts "\n=== Order of Operations ==="
# Order of operations (PEMDAS)
result1 = 2 + 3 * 4
result2 = (2 + 3) * 4
puts "2 + 3 * 4 = #{result1}"
puts "(2 + 3) * 4 = #{result2}"

puts "\n=== Useful Math Methods ==="
# Useful math methods
number = -15.7
puts "Original number: #{number}"
puts "Absolute value: #{number.abs}"
puts "Rounded: #{number.round}"
puts "Rounded up: #{number.ceil}"
puts "Rounded down: #{number.floor}"

# Math with variables
x = 5
y = 2
puts "\n=== Variable Math ==="
puts "x = #{x}, y = #{y}"

# Compound assignment operators
x += y  # Same as x = x + y
puts "After x += y: x = #{x}"

x -= y  # Same as x = x - y
puts "After x -= y: x = #{x}"

x *= y  # Same as x = x * y
puts "After x *= y: x = #{x}"

x /= y  # Same as x = x / y
puts "After x /= y: x = #{x}"

puts "\n=== Simple Calculator ==="
# Building a simple calculator
puts "Enter first number:"
num1 = gets.chomp.to_f

puts "Enter second number:"
num2 = gets.chomp.to_f

puts "\n=== Results ==="
puts "#{num1} + #{num2} = #{num1 + num2}"
puts "#{num1} - #{num2} = #{num1 - num2}"
puts "#{num1} * #{num2} = #{num1 * num2}"

if num2 != 0
  puts "#{num1} / #{num2} = #{num1 / num2}"
else
  puts "Cannot divide by zero!"
end

puts "\n=== Random Numbers ==="
# Random numbers
puts "Random number 1-10: #{rand(1..10)}"
puts "Random number 1-100: #{rand(1..100)}"
puts "Random decimal 0-1: #{rand}"

# Exercise: Temperature Converter
puts "\n=== Temperature Converter ==="
puts "Enter temperature in Fahrenheit:"
fahrenheit = gets.chomp.to_f

celsius = (fahrenheit - 32) * 5.0 / 9.0
puts "#{fahrenheit}°F = #{celsius.round(2)}°C"

# Exercise: Circle Calculator
puts "\n=== Circle Calculator ==="
puts "Enter the radius of a circle:"
radius = gets.chomp.to_f

area = 3.14159 * radius ** 2
circumference = 2 * 3.14159 * radius

puts "Radius: #{radius}"
puts "Area: #{area.round(2)}"
puts "Circumference: #{circumference.round(2)}" 