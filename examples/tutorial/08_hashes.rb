# Lesson 8: Hashes - Key-Value Pairs
# Hashes store data as key-value pairs, like a dictionary

puts "=== Creating Hashes ==="
# Creating hashes
person = {
  "name" => "Alice",
  "age" => 25,
  "city" => "New York"
}

puts "Person hash: #{person}"

# Using symbols as keys (more common in Ruby)
student = {
  name: "Bob",
  age: 20,
  grade: "A",
  subjects: ["Math", "Science", "English"]
}

puts "Student hash: #{student}"

# Empty hash
empty_hash = {}
puts "Empty hash: #{empty_hash}"

puts "\n=== Accessing Hash Values ==="
# Accessing values by key
puts "Person's name: #{person["name"]}"
puts "Person's age: #{person["age"]}"

puts "Student's name: #{student[:name]}"
puts "Student's grade: #{student[:grade]}"

# Using fetch (safer - gives error if key doesn't exist)
puts "Student's age: #{student.fetch(:age)}"

# Using fetch with default value
puts "Student's phone: #{student.fetch(:phone, "Not provided")}"

puts "\n=== Modifying Hashes ==="
# Adding new key-value pairs
person["email"] = "alice@email.com"
puts "After adding email: #{person}"

student[:gpa] = 3.8
puts "After adding GPA: #{student}"

# Changing existing values
person["age"] = 26
puts "After updating age: #{person}"

# Removing key-value pairs
removed_value = person.delete("city")
puts "Removed: #{removed_value}"
puts "Person after removing city: #{person}"

puts "\n=== Hash Methods ==="
colors = {
  red: "#FF0000",
  green: "#00FF00",
  blue: "#0000FF",
  yellow: "#FFFF00"
}

puts "Colors hash: #{colors}"

# Keys and values
puts "Keys: #{colors.keys}"
puts "Values: #{colors.values}"

# Length/size
puts "Number of colors: #{colors.length}"
puts "Number of colors: #{colors.size}"

# Check if key exists
puts "Has red? #{colors.has_key?(:red)}"
puts "Has purple? #{colors.has_key?(:purple)}"

# Check if value exists
puts "Has #FF0000? #{colors.has_value?("#FF0000")}"

# Empty?
puts "Is empty? #{colors.empty?}"

puts "\n=== Iterating Through Hashes ==="
# Using each
puts "Colors using each:"
colors.each do |key, value|
  puts "#{key}: #{value}"
end

# Using each_key
puts "\nJust the keys:"
colors.each_key do |key|
  puts "- #{key}"
end

# Using each_value
puts "\nJust the values:"
colors.each_value do |value|
  puts "- #{value}"
end

puts "\n=== Nested Hashes ==="
# Hashes can contain other hashes
company = {
  name: "Tech Corp",
  employees: {
    ceo: {
      name: "John Smith",
      age: 45,
      salary: 200000
    },
    developer: {
      name: "Jane Doe",
      age: 30,
      salary: 80000
    },
    designer: {
      name: "Mike Johnson",
      age: 28,
      salary: 70000
    }
  }
}

puts "Company: #{company[:name]}"
puts "CEO: #{company[:employees][:ceo][:name]}"
puts "Developer salary: $#{company[:employees][:developer][:salary]}"

puts "\n=== Hash Operations ==="
hash1 = { a: 1, b: 2 }
hash2 = { c: 3, d: 4 }

# Merge hashes
merged = hash1.merge(hash2)
puts "Merged: #{merged}"

# Merge with conflict resolution
hash3 = { a: 10, e: 5 }
merged_with_conflict = hash1.merge(hash3)
puts "Merged with conflict: #{merged_with_conflict}"

# Select - filter key-value pairs
numbers_hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }
evens = numbers_hash.select { |key, value| value.even? }
puts "Even values: #{evens}"

# Reject - opposite of select
odds = numbers_hash.reject { |key, value| value.even? }
puts "Odd values: #{odds}"

puts "\n=== Interactive Examples ==="
# Phone book
phone_book = {}

puts "Phone Book Manager"
puts "Commands: add, lookup, list, delete, quit"

loop do
  puts "\nWhat would you like to do?"
  command = gets.chomp.downcase
  
  case command
  when "add"
    puts "Enter name:"
    name = gets.chomp
    puts "Enter phone number:"
    phone = gets.chomp
    phone_book[name] = phone
    puts "Added #{name}: #{phone}"
    
  when "lookup"
    puts "Enter name to lookup:"
    name = gets.chomp
    if phone_book.has_key?(name)
      puts "#{name}: #{phone_book[name]}"
    else
      puts "#{name} not found in phone book"
    end
    
  when "list"
    if phone_book.empty?
      puts "Phone book is empty"
    else
      puts "Phone Book:"
      phone_book.each do |name, phone|
        puts "#{name}: #{phone}"
      end
    end
    
  when "delete"
    puts "Enter name to delete:"
    name = gets.chomp
    if phone_book.has_key?(name)
      phone_book.delete(name)
      puts "Deleted #{name} from phone book"
    else
      puts "#{name} not found in phone book"
    end
    
  when "quit"
    puts "Goodbye!"
    break
    
  else
    puts "Unknown command. Try: add, lookup, list, delete, quit"
  end
end

# Inventory system
puts "\n=== Inventory System ==="
inventory = {
  apples: { quantity: 50, price: 0.50 },
  bananas: { quantity: 30, price: 0.30 },
  oranges: { quantity: 25, price: 0.75 }
}

puts "Current Inventory:"
inventory.each do |item, details|
  puts "#{item.capitalize}: #{details[:quantity]} units at $#{details[:price]} each"
end

# Calculate total value
total_value = 0
inventory.each do |item, details|
  item_value = details[:quantity] * details[:price]
  total_value += item_value
  puts "#{item.capitalize} total value: $#{item_value.round(2)}"
end

puts "Total inventory value: $#{total_value.round(2)}"

# Word frequency counter
puts "\n=== Word Frequency Counter ==="
puts "Enter a sentence:"
sentence = gets.chomp.downcase

# Split into words and count frequency
words = sentence.split
word_count = {}

words.each do |word|
  # Remove punctuation
  clean_word = word.gsub(/[^a-z]/, '')
  
  if word_count.has_key?(clean_word)
    word_count[clean_word] += 1
  else
    word_count[clean_word] = 1
  end
end

puts "\nWord frequencies:"
word_count.each do |word, count|
  puts "#{word}: #{count}"
end

# Find most common word
most_common = word_count.max_by { |word, count| count }
puts "\nMost common word: '#{most_common[0]}' (appears #{most_common[1]} times)" 