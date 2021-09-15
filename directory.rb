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
      month = gets.chomp
      if month.empty?
        month = :unknown
      end
      if Date::MONTHNAMES[1..].include?(month) || month = :unknown
        #add the students hash to the array
        students << { name: name, cohort: month.to_sym }
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
  current_index = 0
  while current_index < students.length
    puts "#{students[current_index][:name]} (#{students[current_index][:cohort]} cohort)".center(34)
    current_index += 1
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
