class FileAdapter
    def initialize(file_type,filepath)
        @filepath = filepath
        @file = Student_List_Base.new(file_type)
        @file.read_from_file(filepath)
    end

    def student_by_id(student_id)
        @file.student_by_id(student_id)
    end

    def get_k_n_student_short(k,n,data_list=nil)
        @file.get_k_n_student_short(k,n,data_list)
    end

    def add_student(student)
        add_id = @file.add_student(student)
        @file.write_to_file(@filepath)
        add_id
    end

    def remove_student(student_id)
        @file.remove_student(student_id)
        @file.write_to_file(@filepath)
    end

    def replace_student(id,student)
        @file.replace_student(id,student)
        @file.write_to_file(@filepath)
    end

    def student_count
        @file.student_count
    end

end