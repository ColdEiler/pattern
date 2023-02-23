require_relative 'student'

student_1 = Student.new('Минаков ','Владислав','Андреевич', id: 1, phone:'79667665060')
student_2 = Student.new('Титов','Кирилл','Вадимович',id: 2, git:'waasabi13', phone:'79667665060')
#student_3 = Student.new('Головий','Виталий','Александрович',{git:'https://github.com/VitalijGolovi',id:3})

puts student_1
puts student_2
#puts student_3
puts student_1.validate
p student_2.validate
#puts Student.is_val_phone?("79667665060")
#puts Student.is_val_phone?("12312312311")
#puts Student.is_val_phone?("+7 (966)-766-50-60")