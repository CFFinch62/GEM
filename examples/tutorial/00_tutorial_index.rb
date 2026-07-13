# Ruby Beginner Tutorial Series - Index
# Welcome to the comprehensive Ruby programming tutorial!

puts "=" * 60
puts "🚀 RUBY BEGINNER TUTORIAL SERIES 🚀"
puts "=" * 60
puts

puts "Welcome to your Ruby programming journey!"
puts "This tutorial series will teach you Ruby from the ground up."
puts

puts "📚 TUTORIAL LESSONS:"
puts "-" * 40

lessons = [
  {
    number: "01",
    title: "Hello World and Basic Output",
    file: "01_hello_world.rb",
    description: "Your first Ruby program, output, and comments"
  },
  {
    number: "02", 
    title: "Variables and Data Types",
    file: "02_variables.rb",
    description: "Storing data in variables, different data types"
  },
  {
    number: "03",
    title: "Getting User Input", 
    file: "03_user_input.rb",
    description: "Making programs interactive with user input"
  },
  {
    number: "04",
    title: "Math Operations and Calculations",
    file: "04_math_operations.rb", 
    description: "Arithmetic operations and mathematical functions"
  },
  {
    number: "05",
    title: "Conditional Statements",
    file: "05_conditionals.rb",
    description: "Making decisions with if/else statements"
  },
  {
    number: "06",
    title: "Loops",
    file: "06_loops.rb",
    description: "Repeating code with different types of loops"
  },
  {
    number: "07", 
    title: "Arrays",
    file: "07_arrays.rb",
    description: "Working with collections of data"
  },
  {
    number: "08",
    title: "Hashes", 
    file: "08_hashes.rb",
    description: "Key-value pairs and data organization"
  },
  {
    number: "09",
    title: "Methods",
    file: "09_methods.rb",
    description: "Organizing code into reusable functions"
  },
  {
    number: "10",
    title: "Classes and Objects",
    file: "10_classes_objects.rb", 
    description: "Object-oriented programming fundamentals"
  }
]

lessons.each do |lesson|
  puts "Lesson #{lesson[:number]}: #{lesson[:title]}"
  puts "  File: #{lesson[:file]}"
  puts "  #{lesson[:description]}"
  puts
end

puts "=" * 60
puts "🎯 HOW TO USE THIS TUTORIAL:"
puts "=" * 60
puts

puts "1. Start with Lesson 01 and work through them in order"
puts "2. Read the comments in each file carefully"
puts "3. Run each program to see the output"
puts "4. Experiment with the code - change values and see what happens"
puts "5. Complete the exercises at the end of each lesson"
puts

puts "💡 RUNNING THE PROGRAMS:"
puts "-" * 30
puts "• In terminal: ruby lesson_file.rb"
puts "• In RIDE IDE: Open file and press F5 or click 'Run Code'"
puts

puts "📖 ADDITIONAL RESOURCES:"
puts "-" * 30
puts "• README.md - Detailed tutorial guide and exercises"
puts "• Ruby Documentation: https://ruby-doc.org/"
puts "• Practice projects and challenges included in README"
puts

puts "🎉 Ready to start your Ruby journey?"
puts "Open '01_hello_world.rb' to begin!"
puts

puts "=" * 60
puts "Happy coding! 🚀"
puts "=" * 60 