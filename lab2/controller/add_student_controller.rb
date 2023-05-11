require_relative "../student_model/student.rb"
require_relative "../student_list/student_client.rb"
require_relative "controller.rb"

class AddStudentController
    def initialize(parent)
      @main_controller = parent
    end
  
    #привязка view
    def add_view(view)
      @view = view
    end
  
    def validate_fields(fields)      
      begin
        student = Student.new(**fields)
        puts "student"
        #puts student
        return student
  
      rescue ArgumentError
        puts "no validate"
        #puts student
        return false
      end
    end

    def add_st(student)
        @main_controller.add_student(student)
        @main_controller.refresh_data() 
    end
end