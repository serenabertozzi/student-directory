require "date"
Date::MONTHNAMES[1..]
@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.gsub("\n", "")
  #while the name is not empty, repeat this code
  while !name.empty?
    #get the cohort
    puts "Please enter the cohort of the student"
    loop do
      cohort = gets.gsub("\n", "")
      if cohort.empty?
        cohort = :unknown
      end
      if Date::MONTHNAMES[1..].include?(cohort) || cohort = :unknown
        #add the students hash to the array
        @students << { name: name, cohort: cohort.to_sym, hobby: "causing troubles", country_of_birth: :nowhere, height: :unknown }
        puts "Now we have #{@students.count} #{@students.count > 1 ? "students" : "student"}"
        break
      else puts "This doesn't seem quite right..."       end
    end
    #get another name from the user
    name = gets.gsub("\n", "")
  end
end

def intreractive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit "
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "------------------------"
end

def print_students_list
  cohorts = {}
  @students.each do |student|
    if cohorts[student[:cohort]].nil?
      cohorts[student[:cohort]] = []
    end
    cohorts[student[:cohort]] << student[:name]
  end
  cohorts.keys.each do |key|
    puts "#{key} : #{cohorts[key].join(", ")}"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great #{@students.count > 1 ? "students" : "student"}"
end

intreractive_menu
