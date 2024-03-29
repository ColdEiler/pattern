require_relative '../GUI/view.rb'
require_relative '../student_list/data_list_student_short.rb'
require_relative '../student_list/student_client.rb'
require_relative '../student_list/DB_Adapter'
require_relative '../GUI/create_st_dialog.rb'
require 'fox16'
include Fox

class Controller
    def initialize(view)
        @view = view
        @data_list = Data_list_Student_Short.new([])
        @student_client = Student_client.new(DB_Adapter.new)#FileAdapter.new(Student_List_JSON.new,'result_files/students.json'))#DB_Adapter.new
        @pages = @student_client.student_count.div(20)+1
        @currentpage = 1
        @data_list.add_observer(@view)
    end

    def show
        @view.show
    end

    def refresh_data
        @data_list.list = @student_client.get_k_n_student_short(@currentpage,20).list
    end

    def next_page
        if(@currentpage+1<=@pages)
            @currentpage+=1
            refresh_data()
        end
    end

    def prev_page
        if(@currentpage>1)
            @currentpage-=1
            refresh_data()
        end
    end

    def get_currentpage
        @currentpage
    end

    def get_all_pages
        @pages     
    end

    def add_student(student)
        @student_client.add_student(student)
    end

    def show_add
        add_controller = AddStudentController.new(self)
        add_view = CreateStudentDialog.new(@view, add_controller)
        add_controller.add_view(add_view)
        add_view.execute
    end


    def del_student(sel_row_start,sel_row_end,table)
        (sel_row_start..sel_row_end).each do |idx|
            id =  table.getItemText(idx,0)
            @student_client.remove_student(id)
        end
        refresh_data()       
    end
end