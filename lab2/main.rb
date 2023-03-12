require_relative 'student'
require_relative 'student_short.rb'
require_relative 'data_table'
#student_1 = Student.new(lastname: 'Минаков ',firstname: 'Владислав',father_name: 'Андреевич', id: 1, phone:'79667665060')
#student_2 = Student.new(lastname: 'Титов', firstname: 'Кирилл',father_name: 'Вадимович',id: 2, git:'waasabi13', phone:'79667665060')
#student_3 = Student.new('Головий','Виталий','Александрович',{git:'https://github.com/VitalijGolovi',id:3})
#a = student_1.to_json
#student_3 = Student.from_json(a)
#puts a
#puts student_1
#st = Student_short.from_student(student_1)
#puts st
# student_list = Student.read_from_txt("C:\\Users\\Владислав\\RubymineProjects\\labs\\lab2\\read_students.txt")
# student_list.each { |student| puts student.get_info }
# Student.write_to_txt("C:\\Users\\Владислав\\RubymineProjects\\labs\\lab2\\write_students.txt",student_list)

matrix = [[1,"Vanya","Dakukin"],[2,"Vlad","Putin"]]
table = DataTable.new(matrix)

puts table
puts table.get_item(0,1)
