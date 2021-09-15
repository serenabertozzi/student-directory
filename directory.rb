require "date"
Date::MONTHNAMES[1..]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  # get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty?
    #get the cohort
    puts "Please enter the cohort of the student"
    loop do
      cohort = gets.chomp
      if cohort.empty?
        cohort = :unknown
      end
      if Date::MONTHNAMES[1..].include?(cohort) || cohort = :unknown
        #add the students hash to the array
        students << { name: name, cohort: cohort.to_sym }
        puts "Now we have #{students.count} #{students.count > 1 ? "students" : "student"}"
        break
      else puts "This doesn't seem quite right..."       end
    end
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
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

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
