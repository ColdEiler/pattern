require 'sqlite3'


class Student_list_db

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

    
    def initialize(filepath)
        self.client = SQLite3::Database.open filepath
    end

    def student_by_id(id)
        hash = client.prepare('SELECT * FROM student WHERE id = ?').execute(id).first 
        Student.new(**from_array_to_hash(hash))
    end

    def add_student(student)
        command = client.prepare('INSERT INTO student(lastname, firstname, father_name, phone, telegram, email, git) VALUES (?, ?, ?, ?, ?, ?, ?)')
        command.execute(*student_fields(student))
    end

    def replace_student_by_id(id,student)
        command = client.prepare('UPDATE student SET lastname=?, firstname=?, father_name=?, phone=?, telegram=?, email=?, git=? WHERE id=?')
        command.execute(*student_fields(student),id)
    end 

    def delete_student_by_id(id)
        command = client.prepare('DELETE FROM student WHERE id = ?')
        command.execute(id)
    end

    def count
        command = client.execute('select count(id) from student')
    end

    def get_k_n_student_shorts(k,n, ex_data_list:nil)
        offset = (k - 1) * n
        students = client.prepare('SELECT * FROM student LIMIT ?, ?').execute(offset, n)
        slice = students.map { |h| Student_short.from_student(Student.new(**from_array_to_hash(h))) }
        return Data_list_Student_Short.new(slice) if ex_data_list.nil?

        ex_data_list.append(*slice)
        ex_data_list
    end
    
    
    private

    attr_accessor :client
end
