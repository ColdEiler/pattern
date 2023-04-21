require_relative 'app.rb'
require_relative '../student_list/data_list_student_short.rb'
require_relative '../student_list/student_client.rb'

class Controller
    def initialize(view)
        @view = view
        @data_list = Data_list_Student_Short.new([])
        @data_list.add_observer(@view)
        @student_client = Student_client.new(DB_Adapter.new)
    end

    def show
        @view.show
    end

    def refresh_data(k_page,num_students)
        @data_list = @student_client.get_k_n_student_shorts(k_page,num_students)
        @view.update_student_count(@student_client.student_count)
    end
end