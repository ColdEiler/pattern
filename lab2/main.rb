require_relative 'student'
require_relative 'student_short.rb'
require_relative 'data_table'
require_relative 'data_list_student_short'
require_relative 'data_list'
require_relative 'student_list_json'
require_relative 'students_list_YAML'
require_relative 'student_list_txt'
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
#
# puts "ТЕСТ 3.8"
# short1 = Student_short.new(student_1.id,student_1.get_info)
# short2 = Student_short.new(student_2.id,student_2.get_info)
# short3 = Student_short.new(student_3.id,student_3.get_info)
# short_list = Data_list_Student_Short.new([short1, short2, short3])
# short_table = short_list.get_data
# puts short_table
# short_list.select(2)
# puts "Вырбан элемент #2 с id=#{short_list.get_selected}"
# puts 'Тест формирования StudentShort из строк таблицы:'
#
# 0.upto(short_table.rows_count - 1) do |row|
#   stud_info = {}
#   1.upto(short_table.cols_count - 1) do |col|
#     stud_info[short_list.get_names[col - 1].to_sym] = short_table.get_item(row, col)
#   end
#   stID = short_table.get_item(row, 0) +1
#   my_student = Student_short.new(stID, JSON.generate(stud_info))
#   puts my_student
#   end
#

st_list_json = Student_List_JSON.new
st_list_json.add_student(student_1)
st_list_json.add_student(student_2)
st_list_json.add_student(student_3)

st_list_json.write_to_file('./lab2/students.json')
st_list_json.read_from_file('./lab2/students.json')

puts "Read and write #{st_list_json.get_student_short_count} students json!!!"

st_list_yaml = Student_List_YAML.new
st_list_yaml.add_student(student_1)
st_list_yaml.add_student(student_2)
st_list_yaml.add_student(student_3)

st_list_yaml.write_to_file('./lab2/students.yaml')
st_list_yaml.read_from_file('./lab2/students.yaml')

puts "Read and write #{st_list_yaml.get_student_short_count} students yaml"

st_list_txt = Student_List_TXT.new
st_list_txt.add_student(student_1)
st_list_txt.add_student(student_2)
st_list_txt.add_student(student_3)

st_list_txt.write_to_file('./lab2/students.txt')
st_list_txt.read_from_file('./lab2/students.txt')

puts "Read and write #{st_list_txt.get_student_short_count} students txt"