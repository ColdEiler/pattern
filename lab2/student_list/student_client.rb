class Student_client

def initialize(adapter)
    @adapter = adapter
end

def student_by_id(student_id)
    @adapter.student_by_id(student_id)
end

def get_k_n_student_short(k,n,data_list=nil)
    @adapter.get_k_n_student_short(k,n,data_list)
end

def add_student(student)
    @adapter.add_student(student)
end

def remove_student(id)
    @adapter.remove_student(id)
end

def replace_student(id,new_student)
    @adapter.replace_student(id,new_student)
end

def student_count
    @adapter.student_count
end


end