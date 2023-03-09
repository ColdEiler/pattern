require_relative 'student'
require_relative 'student_short.rb'
student_1 = Student.new(lastname: 'Минаков ',firstname: 'Владислав',father_name: 'Андреевич', id: 1, phone:'79667665060')
#student_2 = Student.new(lastname: 'Титов', firstname: 'Кирилл',father_name: 'Вадимович',id: 2, git:'waasabi13', phone:'79667665060')
#student_3 = Student.new('Головий','Виталий','Александрович',{git:'https://github.com/VitalijGolovi',id:3})
#a = student_1.to_json
#student_3 = Student.from_json(a)
puts student_1
st = Student_short.from_student(student_1)
puts st