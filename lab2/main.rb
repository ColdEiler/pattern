require_relative 'student_model/student'
require_relative 'student_model/student_short.rb'
require_relative 'student_list/data_table'
require_relative 'student_list/data_list_student_short'
require_relative 'student_list/data_list'
require_relative 'student_list/student_list_json'
require_relative 'student_list/students_list_YAML'
require_relative 'student_list/student_list_txt'
require_relative 'student_list/Student_list_Base'
require 'sqlite3'
require 'yaml'
require 'json'

student_1 = Student.new(lastname: 'Минаков ',firstname: 'Владислав',father_name: 'Андреевич', id: 1,git:"ColdEiler", phone:'79667665060')
student_2 = Student.new(lastname: 'Титов', firstname: 'Кирилл',father_name: 'Вадимович',id: 2, git:'waasabi13', phone:'79667665060')
student_3 = Student.new(lastname: 'Головий',firstname: 'Виталий',father_name: 'Александрович',git:'vitaliG',id:3,phone:"79002623817")

puts 'Тест подключения к БД:'

#db_config = YAML.load_file('/db/config/setings.yaml').transform_keys(&:to_sym)
client = SQLite3::Database.open "student.db"
results = client.query("SELECT * FROM student")
results.each { |row| puts row }

