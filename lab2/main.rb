require_relative 'student'
require_relative 'student_short.rb'
require_relative 'data_table'
require_relative 'data_list_student_short'
require_relative 'data_list'
require 'json'

student_1 = Student.new(lastname: 'Минаков ',firstname: 'Владислав',father_name: 'Андреевич', id: 1,git:"ColdEiler", phone:'79667665060')
student_2 = Student.new(lastname: 'Титов', firstname: 'Кирилл',father_name: 'Вадимович',id: 2, git:'waasabi13', phone:'79667665060')
student_3 = Student.new(lastname: 'Головий',firstname: 'Виталий',father_name: 'Александрович',git:'vitaliG',id:3,phone:"79002623817")
#a = student_1.to_json
#student_3 = Student.from_json(a)
#puts a
#puts student_1

# student_list = Student.read_from_txt("C:\\Users\\Владислав\\RubymineProjects\\labs\\lab2\\read_students.txt")
# student_list.each { |student| puts student.get_info }
# Student.write_to_txt("C:\\Users\\Владислав\\RubymineProjects\\labs\\lab2\\write_students.txt",student_list)

# matrix = [[1,"Vanya","Dakukin"],[2,"Vlad","Putin"]]
# table = DataTable.new(matrix)
#
# puts table
# puts table.get_item(0,1)

puts "ТЕСТ 3.8"
short1 = Student_short.new(student_1.id,student_1.get_info)
short2 = Student_short.new(student_2.id,student_2.get_info)
short3 = Student_short.new(student_3.id,student_3.get_info)
short_list = Data_list_Student_Short.new([short1, short2, short3])
short_table = short_list.get_data
puts short_table
short_list.select(2)
puts "Вырбан элемент #2 с id=#{short_list.get_selected}"
puts 'Тест формирования StudentShort из строк таблицы:'

0.upto(short_table.rows_count - 1) do |row|
  stud_info = {}
  1.upto(short_table.cols_count - 1) do |col|
    stud_info[short_list.get_names[col - 1].to_sym] = short_table.get_item(row, col)
  end
  stID = short_table.get_item(row, 0) +1
  my_student = Student_short.new(stID, JSON.generate(stud_info))
  puts my_student
  end

