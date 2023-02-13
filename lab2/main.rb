require_relative 'student'

student_1 = Student.new('Минаков ','Владислав','Андреевич', {id: 1, phone:'79667665060'})
student_2 = Student.new('Титов','Кирилл','Вадимович',{id: 2, git:'https://github.com/waasabi13'})
student_3 = Student.new('Головий','Виталий','Александрович',{id: 3, git:'https://github.com/VitalijGolovi'})

puts student_1
puts student_2
puts student_3
