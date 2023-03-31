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
    
    def initialize(filepath)
        self.client = SQLite3::Database.open filepath
    end

    def student_by_id(id)
        hash = client.prepare('SELECT * FROM student WHERE id = ?').execute(id).first 
        Student.new(**from_array_to_hash(hash))
    end

    # def add_student(student)
    #     new_student = client.prepare "Insert into student(lastname,firstname,fathername,phone,telegram,email,git)
    #         values(?,?,?,?,?,?,?)"
    # end

    private

    attr_accessor :client
end
