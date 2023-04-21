# frozen_string_literal: true
require_relative 'tab1_controller.rb'
require 'fox16'
include Fox


class HelloWindow < FXMainWindow
    def create_label(parent,text,x,y)
      FXLabel.new(parent, text , :opts => LAYOUT_EXPLICIT,
        :x => x, :y => y,
        :width => 50, :height => 20)
    end
    
    def create_text(parent,x,y)
      FXText.new(parent,:opts => LAYOUT_EXPLICIT,
        :x => x, :y => y,
        :width => 200, :height => 20)
    end

    def create_combobox(parent,x,y)
      FXComboBox.new(parent,40,:opts => LISTBOX_NORMAL|LAYOUT_EXPLICIT, :x => x, :y => y,
        :width => 200, :height => 20)
    end

    def create_button(parent,text,x,y)
      FXButton.new(parent,text,:opts => LAYOUT_EXPLICIT|BUTTON_NORMAL,:x=>x,:y=>y,
        :width=>40,:height=>25)
    end

    def sort_columns(table,row_num)
      initials =[]
      (0..(row_num-1)).each do |row|
        initials << table.getItemText(row,0)
      end
      initials.to_a
      initials = initials.sort_by{|a| a.size}
      (0..initials.size-1).each do |i|
        table.setItemText(i,0,initials[i]) 
      end
    end

    def initialize(app)
      super(app, "Hello, World!", :width => 1200, :height => 600)
      @count_page = 3
      
      @count_student = 0
      @student_on_table = 20
      @currentpage = 1 
      @controller =  Controller.new(self)


      tabbook = FXTabBook.new(self, :opts => LAYOUT_FILL) 
      student_tab = FXTabItem.new(tabbook, " Students ")
      student_page = FXVerticalFrame.new(tabbook,:opts => FRAME_RAISED|LAYOUT_FILL)
      frame = FXVerticalFrame.new(student_page, :opts => LAYOUT_LEFT)
      
      create_label(frame, "ФИО", 0,0)
      fio_text = create_text(frame,0,20)
      
      state_names = ['Нет','Да','Неважно'] 
      
      
      create_label(frame,"Email",0,50)
      email_combobox = create_combobox(frame,0,70) 
      state_names.each { |name| email_combobox.appendItem(name)}
      email_text = create_text(frame,0,100)
      email_text.editable = false
      check_combobox(email_combobox,email_text)

      create_label(frame,"git",0,120)
      git_combobox = create_combobox(frame,0,140)
      state_names.each { |name| git_combobox.appendItem(name)}
      git_text = create_text(frame,0,170)
      git_text.editable = false
      check_combobox(git_combobox,git_text)

      create_label(frame,"Телефон",0,190)
      phone_combobox = create_combobox(frame,0,210)
      state_names.each { |name| phone_combobox.appendItem(name)}
      phone_text = create_text(frame,0,240)
      phone_text.editable = false
      check_combobox(phone_combobox,phone_text)

      create_label(frame,"Телеграм",0,260)
      teleg_combobox = create_combobox(frame,0,280)
      state_names.each { |name| teleg_combobox.appendItem(name)}
      teleg_text = create_text(frame,0,310)
      teleg_text.editable = false
      check_combobox(teleg_combobox,teleg_text)
      
      table = FXTable.new(frame,:opts =>LAYOUT_EXPLICIT|TABLE_NO_ROWSELECT|TABLE_NO_COLSELECT|TABLE_ROW_RENUMBER,:x=>250,:y=>0,:height=>400,:width=>470)
      table.setTableSize(20,3)
      table.tableStyle |=TABLE_ROW_SIZABLE|TABLE_COL_SIZABLE 
      table.setColumnText(0, "ФИО")
      table.setColumnText(1, "Contact")
      table.setColumnText(2, "Git")
      table.editable = false


      btn_back=FXButton.new(frame, "Назад", :opts=> BUTTON_INITIAL|LAYOUT_EXPLICIT, :x=>250,:y=>420,:height=>30,:width=>40)
      btn_back.textColor = Fox.FXRGB(0,23,175)
      #добавить отображение со страницы, на которой мы сейчас
      res=Array(1..@count_page).join(' ')
      @page_label = FXLabel.new(frame, res,:opts=> LAYOUT_EXPLICIT, :x=>280,:y=>420,:height=>30,:width=>50)
      btn_next=FXButton.new(frame, "Далее", :opts=> BUTTON_INITIAL|LAYOUT_EXPLICIT, :x=>350,:y=>420,:height=>30,:width=>40)
      btn_next.textColor = Fox.FXRGB(0,23,175)


      ex = [
        ["Минаков В.А","valdos777m@gmail.com","ColdEiler"],
        ["Иванов В.А","79667665060","Coler"],
        ["Власовенко О.А","vlasovOleg@gmail.com","Vlasik"]
      ]
      row_num = ex.length

      (0..ex.length-1).each do |i|
        (0..ex[i].length-1).each do |j|
          table.setItemText(i,j,ex[i][j])
          table.setItemJustify(i,j, FXTableItem::CENTER_X)
        end
      end

      btn_next.connect(SEL_COMMAND) do
        table.killSelection
      end

      
      btn_back.connect(SEL_COMMAND) do
        table.killSelection
      end

      create_button = FXButton.new(frame,"Добавить",:opts => LAYOUT_EXPLICIT|BUTTON_NORMAL,:x=>1000,:y=>50,
        :width=>80,:height=>25)
      update_button = FXButton.new(frame,"Обновить",:opts => LAYOUT_EXPLICIT|BUTTON_NORMAL,:x=>1000,:y=>100,
        :width=>80,:height=>25)
      delete_button = FXButton.new(frame,"Удалить",:opts => LAYOUT_EXPLICIT|BUTTON_NORMAL,:x=>1000,:y=>150,
        :width=>80,:height=>25)
      delete_button.enabled = false
      edit_button = FXButton.new(frame,"Изменить",:opts => LAYOUT_EXPLICIT|BUTTON_NORMAL,:x=>1000,:y=>200,
        :width=>80,:height=>25)
      edit_button.enabled = false      

      
      button_sort = FXButton.new(frame,"Сортировка ФИО ",:opts =>LAYOUT_EXPLICIT|BUTTON_NORMAL,:x=>1000,:y=>250,:height=>20,:width=>130)

      
      button_sort.connect(SEL_COMMAND) do |sender, sel, pos|
         sort_columns(table,ex.length) 
      end

      table.connect(SEL_COMMAND) do 
          if get_select_rows(table) == 0 then 
            edit_button.enabled = true
            delete_button.enabled = true
          end

          if get_select_rows(table) > 0 then
            delete_button.enabled = true
            edit_button.enabled = false
          end

          if get_select_rows(table) < 0 then 
            delete_button.enabled = false
            edit_button.enabled = false
          end 
           
      end  
      exit_button = FXButton.new(frame,"Выход",:opts =>LAYOUT_EXPLICIT|BUTTON_NORMAL,:x=>1050,:y=>500,:height=>50,:width=>130)
      exit_button.connect(SEL_COMMAND) do
        exit
      end


      contact_tab = FXTabItem.new(tabbook, " Tab1 ")
      contact_page = FXVerticalFrame.new(tabbook,:opts => FRAME_RAISED|LAYOUT_FILL)
      extras_tab = FXTabItem.new(tabbook, " Tab2 ")
      extras_page = FXVerticalFrame.new(tabbook,:opts => FRAME_RAISED|LAYOUT_FILL)
    end
    
    def get_select_rows(table)
      table.selEndRow - table.selStartRow
    end
    
    def check_combobox(combobox,text)
      combobox.connect(SEL_COMMAND) do |sender, sel, index|
        text.editable = false if sender.currentItem !=1
        text.editable = true if sender.currentItem == 1 
      end      
    end

    def update_student_count(count)
      @count_student = count
      #здесь надо отображение page_label сделать
    
    end

    def datalist_changed(table)
      row_number = 0 
      table.each do |row|
        (1..3).each do |index|
          table.setItemText(row_number,index-1,row[index].to_s)
        end
        row_number+=1
      end
    end  
    def create
      super
      show(PLACEMENT_SCREEN)
    end
end

app = FXApp.new
HelloWindow.new(app)
app.create
app.run
