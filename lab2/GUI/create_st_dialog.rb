require_relative '../controller/add_student_controller.rb'
require 'fox16'
include Fox

class CreateStudentDialog<FXDialogBox
  def initialize(parent, controller)
    # Создаем родительское модальное окно
    super(parent, "Добавление студента", DECOR_TITLE | DECOR_BORDER | DECOR_RESIZE)

    @controller = controller

    # Устанавливаем размер окна и делаем его модальным
    setWidth(500)
    setHeight(300)
    add_fields()
    # setModal(true)
  end

  def add_fields
    #кнопка отмены

    frame_data = FXVerticalFrame.new(self, :opts=> LAYOUT_FILL_X|LAYOUT_FILL_Y )

    field_name =[[:lastname,'Фамилия'], [:firstname, 'Имя'], [:father_name, 'Отчество'], [:git, 'Гит'], [:email, 'Почта'], [:phone, 'Телефон'], [:telegram, 'Телеграм']]
    @field_text = {}
    field_name.each do |field|
      frame_field = FXHorizontalFrame.new(frame_data )
      field_label = FXLabel.new(frame_field, field[1], :opts => LAYOUT_FIX_WIDTH)
      field_label.setWidth(100)
      text = FXTextField.new(frame_field, 40, :opts=>TEXTFIELD_NORMAL)
      @field_text[field[0]] = text
    end

    btn_add=FXButton.new(frame_data, "Добавить")
    btn_add.textColor = Fox.FXRGB(0,23,175)
    btn_add.disable
    btn_add=FXButton.new(frame_data, "Выход")

    result = ""
    @field_text.each_key do |name_field|
      @field_text[name_field].connect(SEL_CHANGED) do |text_field|
        res = []
        @field_text.each do |k,v|
          text = v.text.empty? ? nil : v.text
          res<<[k,text]
        end
        res = res.to_h

        result = @controller.validate_fields(res)
        if result.class == Student
          btn_add.enable
        else
          btn_add.disable
        end
      end
      
      btn_add.connect(SEL_COMMAND) do 
        @controller.add_st(result) 
      end
    end
    
  end
end