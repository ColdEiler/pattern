require 'sqlite3'
#require_relative 'singleton_db.rb'

class Student_list_db
    #public_class_method :new
    @@instance=nil
    
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

    def self.instance(filepath)
		if @@instance then
            @@instance.set_parameter(filepath)
		else 
            @@instance = Student_list_db.new(filepath)
		end
		return @@instance
	end

    def set_parameter(filepath)
        self.client = SQLite3::Database.open filepath
    end
    
    private def initialize(filepath)
        self.set_parameter(filepath)
        #self.client = SQLite3::Database.open filepath
        #self.singleton = Singleton.instance
    end

    def student_by_id(id)
        hash = client.prepare('SELECT * FROM student WHERE id = ?').execute(id).first 
        Student.new(**from_array_to_hash(hash))
    end

    def add_student(student)
        command = client.prepare('INSERT INTO student(lastname, firstname, father_name, phone, telegram, email, git) VALUES (?, ?, ?, ?, ?, ?, ?)')
        command.execute(*student_fields(student))
    end

    def replace_student(id,student)
        command = client.prepare('UPDATE student SET lastname=?, firstname=?, father_name=?, phone=?, telegram=?, email=?, git=? WHERE id=?')
        command.execute(*student_fields(student),id)
    end 

    def remove_student(id)
        command = client.prepare('DELETE FROM student WHERE id = ?')
        command.execute(id)
    end

    def student_count
        command = client.execute('select count(id) from student')
    end

    def get_k_n_student_short(k,n, ex_data_list = nil)
        offset = (k - 1) * n
        students = client.prepare('SELECT * FROM student LIMIT ?, ?').execute(offset, n)
        slice = students.map { |h| Student_short.from_student(Student.new(**from_array_to_hash(h))) }
        return Data_list_Student_Short.new(slice) if ex_data_list.nil?
    end
    

    
    
    private

    attr_accessor :client #,:singleton
end
