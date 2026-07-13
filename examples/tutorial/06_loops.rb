# Lesson 6: Loops - Repeating Code
# Loops let you repeat code multiple times

puts "=== Times Loop ==="
# times loop - repeat a specific number of times
5.times do
  puts "Hello!"
end

# You can use the block variable to track iterations
puts "\nCounting with times:"
5.times do |i|
  puts "This is iteration #{i + 1}"
end

puts "\n=== While Loop ==="
# while loop - repeat while a condition is true
counter = 1
while counter <= 5
  puts "Counter is #{counter}"
  counter += 1  # Don't forget to increment!
end

# Interactive while loop
puts "\nEnter 'quit' to stop:"
input = ""
while input != "quit"
  puts "Enter something (or 'quit' to exit):"
  input = gets.chomp
  puts "You entered: #{input}" unless input == "quit"
end

puts "\n=== Until Loop ==="
# until loop - repeat until a condition becomes true
number = 1
until number > 5
  puts "Number is #{number}"
  number += 1
end

puts "\n=== For Loop ==="
# for loop with ranges
puts "Counting 1 to 5:"
for i in 1..5
  puts "i = #{i}"
end

puts "\nCounting 1 to 10 by 2s:"
for i in (1..10).step(2)
  puts "i = #{i}"
end

puts "\n=== Each Loop with Arrays ==="
# each loop with arrays (we'll learn more about arrays later)
fruits = ["apple", "banana", "orange", "grape"]
puts "My favorite fruits:"
fruits.each do |fruit|
  puts "- #{fruit}"
end

puts "\n=== Loop Control ==="
# break - exit the loop early
puts "Breaking out of loop:"
10.times do |i|
  if i == 3
    puts "Breaking at #{i}"
    break
  end
  puts "i = #{i}"
end

# next - skip to next iteration
puts "\nSkipping even numbers:"
10.times do |i|
  next if i.even?  # Skip if i is even
  puts "Odd number: #{i}"
end

puts "\n=== Nested Loops ==="
# Loops inside loops
puts "Multiplication table (1-3):"
for i in 1..3
  for j in 1..3
    product = i * j
    print "#{i}x#{j}=#{product} "
  end
  puts  # New line after each row
end

puts "\n=== Interactive Examples ==="

# Countdown timer
puts "Enter a number to count down from:"
start = gets.chomp.to_i

while start > 0
  puts start
  start -= 1
  sleep(1)  # Wait 1 second (remove this if you don't want delays)
end
puts "Blast off! 🚀"

# Sum calculator
puts "\nSum Calculator (enter 0 to stop):"
total = 0
loop do  # infinite loop
  puts "Enter a number (0 to stop):"
  number = gets.chomp.to_i
  
  if number == 0
    break
  end
  
  total += number
  puts "Running total: #{total}"
end
puts "Final total: #{total}"

# Password attempts
puts "\nPassword System (3 attempts):"
correct_password = "ruby123"
attempts = 0
max_attempts = 3

while attempts < max_attempts
  puts "Enter password (attempt #{attempts + 1}/#{max_attempts}):"
  password = gets.chomp
  
  if password == correct_password
    puts "Access granted!"
    break
  else
    attempts += 1
    remaining = max_attempts - attempts
    if remaining > 0
      puts "Wrong password. #{remaining} attempts remaining."
    else
      puts "Access denied. No attempts remaining."
    end
  end
end

puts "\n=== Pattern Printing ==="
# Print patterns using loops
puts "Triangle pattern:"
5.times do |i|
  (i + 1).times do
    print "* "
  end
  puts
end

puts "\nNumber pyramid:"
5.times do |i|
  # Print spaces
  (5 - i - 1).times { print " " }
  # Print numbers
  (i + 1).times { |j| print "#{j + 1} " }
  puts
end

# Exercise: Guessing Game with Limited Attempts
puts "\n=== Number Guessing Game ==="
secret = rand(1..10)
max_guesses = 3
guesses = 0

puts "I'm thinking of a number between 1 and 10."
puts "You have #{max_guesses} guesses!"

while guesses < max_guesses
  puts "Enter your guess:"
  guess = gets.chomp.to_i
  guesses += 1
  
  if guess == secret
    puts "Congratulations! You guessed it in #{guesses} tries!"
    break
  elsif guess < secret
    puts "Too low!"
  else
    puts "Too high!"
  end
  
  remaining = max_guesses - guesses
  if remaining > 0
    puts "#{remaining} guesses remaining."
  else
    puts "Game over! The number was #{secret}."
  end
end 