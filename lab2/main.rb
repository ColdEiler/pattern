require_relative 'student_model/student'
require_relative 'student_model/student_short.rb'
require_relative 'student_list/data_table'
require_relative 'student_list/data_list_student_short'
require_relative 'student_list/data_list'
require_relative 'student_list/student_list_json'
require_relative 'student_list/students_list_YAML'
require_relative 'student_list/student_list_txt'
require_relative 'student_list/Student_list_Base'
require_relative 'student_list/student_list_db'
require_relative 'student_list/student_client'
require_relative 'student_list/File_adapter'
require 'sqlite3'
require 'yaml'
require 'json'

# student_1 = Student.new(lastname: 'Минаков ',firstname: 'Владислав',father_name: 'Андреевич', id: 1,git:"ColdEiler", phone:'79667665060')
# student_2 = Student.new(lastname: 'Титов', firstname: 'Кирилл',father_name: 'Вадимович',id: 2, git:'waasabi13', phone:'79667665060')
#student_3 = Student.new(lastname: 'Головий',firstname: 'Виталий',father_name: 'Александрович',git:'vitaliG',id:3,phone:"79002623817")

def test(client)
    puts client.student_count

    puts client.student_by_id(4)
end

puts "File test (JSON)"

client_json = Student_client.new(FileAdapter.new(Student_List_JSON.new,'result_files/students.json'))

test(client_json)


puts "File test DB"

client_db = Student_client.new(Student_list_db.instance("C:/Users/Владислав/OneDrive - FGBOU VO Kubanskiy Gosudarstvennyi Universitet/Рабочий стол/labs/lab2/student.db"))

test(client_db)
