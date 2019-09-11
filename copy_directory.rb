def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end   
  # return the array of students
  students
end	


 def print_header
   puts "The students of Villains Academy"
   puts "-------------"
 end	

def print(students)
  students.each_with_index do |student, index|
    index_plus_one = index + 1
    name = student[:name]
    if name.start_with?('S') && name.length < 12
      puts "#{index_plus_one}. #{student[:name]} (#{student[:cohort]} cohort)"
    end 
  end 
end 

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
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



