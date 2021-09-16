require "date"
Date::MONTHNAMES[1..]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
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
        students << { name: name, cohort: cohort.to_sym, hobby: "causing troubles", country_of_birth: :nowhere, height: :unknown }
        puts "Now we have #{students.count} #{students.count > 1 ? "students" : "student"}"
        break
      else puts "This doesn't seem quite right..."       end
    end
    #get another name from the user
    name = gets.gsub("\n", "")
  end
  #return the array of students
  if !students.empty?
    students
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "------------------------"
end

def print(students)
  cohorts = {}
  students.each do |student|
    if cohorts[student[:cohort]].nil?
      cohorts[student[:cohort]] = []
    end
    cohorts[student[:cohort]] << student[:name]
  end
  cohorts.keys.each do |key|
    puts "#{key} : #{cohorts[key].join(", ")}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great #{students.count > 1 ? "students" : "student"}"
end

def intreractive_menu
  students = []
  loop do
    #1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit "
    #2. read the input and save it into a variable
    selection = gets.chomp
    #3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit #this will cause the program to terminate
    else puts "I don't know what you meant, try again"
    end
  end
end

intreractive_menu
