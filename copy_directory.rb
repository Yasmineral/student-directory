@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
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
      save_students  
    when "4"
      load_students
    when "9"
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
    cohort = gets.chomp.downcase
    while !months.include?(cohort)
      puts "Month not valid. Re-enter"
      cohort = STDIN.gets.chomp.downcase
    end
   @students << {name: name, cohort: (cohort.to_sym)}
    if @students.count == 1 
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end  
    # get another name from the user
    name = STDIN.gets.chomp
  end   
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

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close 
end  

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close    
end  

def try_load_students
  # first argument from command line
  filename = ARGV.first
  # get out of the method if it doesnn't exist 
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist" 
    exit
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
 
try_load_students
interactive_menu




