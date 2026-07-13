# Lesson 7: Arrays - Collections of Data
# Arrays store multiple values in a single variable

puts "=== Creating Arrays ==="
# Creating arrays
fruits = ["apple", "banana", "orange"]
numbers = [1, 2, 3, 4, 5]
mixed = ["hello", 42, true, 3.14]

puts "Fruits: #{fruits}"
puts "Numbers: #{numbers}"
puts "Mixed: #{mixed}"

# Empty array
empty_array = []
puts "Empty array: #{empty_array}"

puts "\n=== Accessing Array Elements ==="
# Accessing elements by index (starts at 0)
puts "First fruit: #{fruits[0]}"
puts "Second fruit: #{fruits[1]}"
puts "Third fruit: #{fruits[2]}"

# Negative indices count from the end
puts "Last fruit: #{fruits[-1]}"
puts "Second to last: #{fruits[-2]}"

# Array length
puts "Number of fruits: #{fruits.length}"
puts "Number of fruits: #{fruits.size}"  # same as length

puts "\n=== Modifying Arrays ==="
# Adding elements
fruits << "grape"  # Add to end
puts "After adding grape: #{fruits}"

fruits.push("kiwi")  # Another way to add to end
puts "After adding kiwi: #{fruits}"

fruits.unshift("strawberry")  # Add to beginning
puts "After adding strawberry to beginning: #{fruits}"

# Removing elements
last_fruit = fruits.pop  # Remove and return last element
puts "Removed: #{last_fruit}"
puts "Fruits now: #{fruits}"

first_fruit = fruits.shift  # Remove and return first element
puts "Removed: #{first_fruit}"
puts "Fruits now: #{fruits}"

# Changing elements
fruits[1] = "mango"
puts "After changing second fruit: #{fruits}"

puts "\n=== Array Methods ==="
numbers = [3, 1, 4, 1, 5, 9, 2, 6]
puts "Original numbers: #{numbers}"

# Sorting
sorted_numbers = numbers.sort
puts "Sorted: #{sorted_numbers}"
puts "Original unchanged: #{numbers}"

# Sort in place (modifies original)
numbers.sort!
puts "After sort!: #{numbers}"

# Reverse
reversed = numbers.reverse
puts "Reversed: #{reversed}"

# Include? - check if element exists
puts "Does array include 5? #{numbers.include?(5)}"
puts "Does array include 10? #{numbers.include?(10)}"

# Index - find position of element
puts "Index of 5: #{numbers.index(5)}"
puts "Index of 10: #{numbers.index(10)}"  # returns nil if not found

puts "\n=== Iterating Through Arrays ==="
colors = ["red", "green", "blue", "yellow"]

# Using each
puts "Colors using each:"
colors.each do |color|
  puts "- #{color}"
end

# Using each with index
puts "\nColors with index:"
colors.each_with_index do |color, index|
  puts "#{index}: #{color}"
end

# Using for loop
puts "\nColors using for loop:"
for color in colors
  puts "* #{color}"
end

puts "\n=== Array Operations ==="
array1 = [1, 2, 3]
array2 = [4, 5, 6]

# Concatenation
combined = array1 + array2
puts "Combined: #{combined}"

# Subtraction
all_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
some_numbers = [2, 4, 6, 8]
difference = all_numbers - some_numbers
puts "Difference: #{difference}"

# Intersection (common elements)
list1 = [1, 2, 3, 4, 5]
list2 = [3, 4, 5, 6, 7]
common = list1 & list2
puts "Common elements: #{common}"

puts "\n=== Useful Array Methods ==="
test_numbers = [1, 2, 3, 4, 5]

# Map - transform each element
doubled = test_numbers.map { |n| n * 2 }
puts "Doubled: #{doubled}"

# Select - filter elements
evens = test_numbers.select { |n| n.even? }
puts "Even numbers: #{evens}"

# Reject - opposite of select
odds = test_numbers.reject { |n| n.even? }
puts "Odd numbers: #{odds}"

# Sum
total = test_numbers.sum
puts "Sum: #{total}"

# Max and Min
puts "Max: #{test_numbers.max}"
puts "Min: #{test_numbers.min}"

puts "\n=== Multi-dimensional Arrays ==="
# Arrays can contain other arrays
matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

puts "Matrix:"
matrix.each do |row|
  puts row.join(" ")
end

# Accessing elements in 2D array
puts "Element at row 1, column 2: #{matrix[1][2]}"

puts "\n=== Interactive Examples ==="
# Shopping list manager
shopping_list = []

puts "Shopping List Manager"
puts "Commands: add, remove, list, quit"

loop do
  puts "\nWhat would you like to do?"
  command = gets.chomp.downcase
  
  case command
  when "add"
    puts "What item to add?"
    item = gets.chomp
    shopping_list << item
    puts "Added #{item} to the list"
    
  when "remove"
    if shopping_list.empty?
      puts "List is empty!"
    else
      puts "Current list: #{shopping_list.join(', ')}"
      puts "What item to remove?"
      item = gets.chomp
      if shopping_list.include?(item)
        shopping_list.delete(item)
        puts "Removed #{item} from the list"
      else
        puts "Item not found in list"
      end
    end
    
  when "list"
    if shopping_list.empty?
      puts "Your shopping list is empty"
    else
      puts "Your shopping list:"
      shopping_list.each_with_index do |item, index|
        puts "#{index + 1}. #{item}"
      end
    end
    
  when "quit"
    puts "Goodbye!"
    break
    
  else
    puts "Unknown command. Try: add, remove, list, quit"
  end
end

# Grade calculator
puts "\n=== Grade Calculator ==="
puts "Enter grades (enter 'done' when finished):"
grades = []

loop do
  puts "Enter a grade:"
  input = gets.chomp
  
  if input.downcase == "done"
    break
  end
  
  grade = input.to_f
  if grade >= 0 && grade <= 100
    grades << grade
    puts "Added grade: #{grade}"
  else
    puts "Please enter a grade between 0 and 100"
  end
end

if grades.empty?
  puts "No grades entered"
else
  average = grades.sum / grades.length.to_f
  puts "\nGrade Summary:"
  puts "Grades: #{grades.join(', ')}"
  puts "Number of grades: #{grades.length}"
  puts "Average: #{average.round(2)}"
  puts "Highest: #{grades.max}"
  puts "Lowest: #{grades.min}"
end 