@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end  

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end 

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      try_save_students 
    when "4"
      load_students
    when "9"
      puts "\n"
      puts "Goodbye!"
      exit
    else
      puts "I don't understand what you mean, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Cohort?"
    cohort = STDIN.gets.chomp.downcase
    while !months.include?(cohort)
      puts "Month not valid. Re-enter"
      cohort = STDIN.gets.chomp.downcase
    end
    add_student(name, cohort)
    if @students.count == 1 
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end  
    # get another name from the user
    name = STDIN.gets.chomp
  end   
end

def add_student(name, cohort)
  @students << {name: name, cohort: (cohort.to_sym)}
end

def show_students
  print_header
  print_students_list
  print_footer
end  

 def print_header
   puts "The students of Villains Academy".center(50)
   puts "-------------".center(50)
 end

 def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(50)
  end  
end 

def print_footer
  puts "\n"
  puts "Overall, we have #{@students.count} great students".center(50)
end

def save_students(filename)
  File.open(filename, "w") do |f|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      f.puts csv_line
    end
  end
 end 
 

def load_students(filename = "students.csv")
  File.open(filename, "r") do |f|
    f.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      add_student(name, cohort)
    end
  end   
end  

def try_load_students
  # first argument from command line
  filename = ARGV.first
  # get out of the method if it doesn't exist 
  if filename.nil?
    load_students("students.csv")
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist" 
    exit
  end     
end 

def try_save_students
  puts "Which file should I save to?"
  file = STDIN.gets.chomp 
  if file.empty?
    puts "Saving to default file: students.csv"
    save_students("students.csv")
  elsif File.exists?(file)
    save_students(file)
    puts "Students saved to: #{file}"
  else
    puts "Sorry, #{file} doesn't exist"
  end     
end


# --- my extra methods --
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

def print_by_cohort
  puts "Which cohort would you like to search for?"
  input = gets.chomp
  puts "Here are all of #{input}'s' students:"
  input = input.downcase.to_sym
  @students.map do |student| if student[:cohort] == input
    puts "#{student[:name]}" end
  end
end 

# --
 
interactive_menu




