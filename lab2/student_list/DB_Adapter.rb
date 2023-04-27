require 'sqlite3'
require_relative 'Db_source.rb'

class DB_Adapter
    
    def from_array_to_hash(arr)
        attrs = {}
        i=0
        %i[id lastname firstname father_name phone telegram email git].each do |attr|
            attrs[attr] = arr[i] unless arr[i].nil?
            i=i+1
        end
        attrs
    end

    def student_fields(student)
         [student.lastname, student.firstname, student.father_name, student.phone,student.telegram, student.email, student.git]
    end

    def initialize
        @db = DB_Source.instance
    end

    def student_by_id(id)
        hash = @db.exec('SELECT * FROM student WHERE id = ?',id).first 
        Student.new(**from_array_to_hash(hash))
    end

    def add_student(student)
        command = @db.exec('INSERT INTO student(lastname, firstname, father_name, phone, telegram, email, git) VALUES (?, ?, ?, ?, ?, ?, ?)',*student_fields(student))
    end

    def replace_student(id,student)
        command = @db.exec('UPDATE student SET lastname=?, firstname=?, father_name=?, phone=?, telegram=?, email=?, git=? WHERE id=?',*student_fields(student),id)
    end 

    def remove_student(id)
        command = @db.exec('DELETE FROM student WHERE id = ?',id)
    end

    def student_count
        command = @db.exec('select count(id) from student')
        command[0][0]
    end

    def get_k_n_student_short(k,n, ex_data_list = nil)
        offset = (k - 1) * n
        students = @db.exec('SELECT * FROM student LIMIT ?, ?',offset,n)
        slice = students.map { |h| Student_short.from_student(Student.new(**from_array_to_hash(h))) }
        return Data_list_Student_Short.new(slice) if ex_data_list.nil?
    end

end
