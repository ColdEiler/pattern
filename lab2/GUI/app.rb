# frozen_string_literal: true
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
        :width=>20,:height=>15)
    end

    def initialize(app)
      super(app, "Hello, World!", :width => 1200, :height => 600)
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
      check_combobox(git_combobox,git_text)

      create_label(frame,"Телефон",0,190)
      phone_combobox = create_combobox(frame,0,210)
      state_names.each { |name| phone_combobox.appendItem(name)}
      phone_text = create_text(frame,0,240)
      check_combobox(phone_combobox,phone_text)

      create_label(frame,"Телеграм",0,260)
      teleg_combobox = create_combobox(frame,0,280)
      state_names.each { |name| teleg_combobox.appendItem(name)}
      teleg_text = create_text(frame,0,310)
      check_combobox(teleg_combobox,teleg_text)
      
      table = FXTable.new(frame,:opts =>LAYOUT_EXPLICIT,:x=>250,:y=>0,:height=>400,:width=>650)
      table.setTableSize(20,5)
      table.tableStyle |=TABLE_ROW_SIZABLE|TABLE_COL_SIZABLE 
      table.setColumnText(0, "ФИО")
      table.setColumnText(1, "Email")
      table.setColumnText(2, "Git")
      table.setColumnText(3, "Phone")
      table.setColumnText(4, "Telegram")
      table.editable = false
      
      ex = [
        ["Минаков В.А","valdos777m@gmail.com","ColdEiler",nil,nil],
        ["Иванов В.А",nil,"Coler","79667665060",nil],
        ["Власов О.А","vlasovOleg@gmail.com","Vlasik","79667665060","@midle"]
      ]

      (0..2).each do |i|
        (0..4).each do |j|
          table.setItemText(i,j,ex[i][j])
        end  
      end
      
      x = 300
      y = 420
      (0..19).each do |i|
        new_x = x+30*i 
        create_button(frame,"#{i+1}",new_x,y)
      end

      

      contact_tab = FXTabItem.new(tabbook, " Tab1 ")
      contact_page = FXVerticalFrame.new(tabbook,:opts => FRAME_RAISED|LAYOUT_FILL)
      extras_tab = FXTabItem.new(tabbook, " Tab2 ")
      extras_page = FXVerticalFrame.new(tabbook,:opts => FRAME_RAISED|LAYOUT_FILL)
    end
    
    def check_combobox(combobox,text)
      combobox.connect(SEL_COMMAND) do |sender, sel, index|
        text.editable = false if sender.currentItem !=1
        text.editable = true if sender.currentItem == 1 
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
