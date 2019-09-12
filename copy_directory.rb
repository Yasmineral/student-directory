def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Cohort?"
    cohort = gets.chomp.downcase
    while !months.include?(cohort)
      puts "Month not valid. Re-enter"
      cohort = gets.chomp.downcase
    end
   students << {name: name, cohort: (cohort.to_sym)}
    if students.count == 1 
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end  
    # get another name from the user
    name = gets.chomp
  end   
  # return the array of students
 students
end 


 def print_header
   puts "The students of Villains Academy".center(50)
   puts "-------------".center(50)
 end	

def print(students)
  counter = 1
  while counter <= students.length do
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(50)
    counter += 1
  end  
end
end 

def print_footer(names)
  puts "\n"
  puts "Overall, we have #{names.count} great students".center(50)
end

def name_starts_with(names)
  puts "Which letter would you like to search?"
  letter = gets.chomp.downcase
  names.each do |person|
    name = (person[:name]).downcase
    if name.start_with?(letter)
      puts name.capitalize
    end
  end
end 


students = input_students
print_header
print(students)
print_footer(students)



