require_relative '../GUI/view.rb'
require_relative '../student_list/data_list_student_short.rb'
require_relative '../student_list/student_client.rb'
require_relative '../student_list/DB_Adapter'

class Controller
    def initialize(view)
        @view = view
        @data_list = Data_list_Student_Short.new([])
        @student_client = Student_client.new(DB_Adapter.new)
    end

    def show
        @view.show
    end

    def refresh_data(k_page)
        @data_list = @student_client.get_k_n_student_short(k_page,20)
        @data_list.add_observer(@view)
        @data_list.notify()
    end

    def next_page
    end

    def prev_page
    end
end