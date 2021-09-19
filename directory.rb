require "csv"
@students = []

COMMANDS = {
  "1" => ["Input the students", :input_students],
  "2" => ["Show the students", :show_students],
  "3" => ["Save the list to students.csv", :save_students],
  "4" => ["Load the list from students.csv", :load_students],
  "9" => ["Exit", :exit],
}

def print_menu
  COMMANDS.each do |key, value|
    puts "#{key}. #{value[0]}"
  end
end

def intreractive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  command = COMMANDS[selection][1]
  if command.nil?
    puts "I don't know what you meant, try again"
  else
    send(command)
  end
end

def read_student(string)
  name, cohort = string.chomp.split(",")
  @students << { name: name, cohort: cohort || :november }
end

def input_students
  puts "Here you can input new students"
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  loop do
    line = STDIN.gets.chomp
    break if line.empty?
    read_student(line)
    puts "Now we have #{@students.count} students"
  end
end

def load_students(filename = "students.csv")
  puts "Loading the list of students"
  @students.clear
  CSV.read(filename).each { |row| @students << { name: row[0], cohort: row[1] } }
end

def show_students
  puts "Showing the students"
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "------------------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great #{@students.count > 1 ? "students" : "student"}"
end

def save_students
  puts "Saving the list of students"
  # open the file for writing
  puts "Please, write a name for the students list"
  CSV.open("#{STDIN.gets.chomp}.csv", "w") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv << student_data
    end
  end
end

def try_load_students
  filename = ARGV.first || "students.csv"
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
intreractive_menu
