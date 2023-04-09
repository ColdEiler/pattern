# frozen_string_literal: true
require 'fox16'
include Fox

class TabStudents < FXTabItem
  
end

class Tab2

end

class Tab3

end


class HelloWindow < FXMainWindow
    def initialize(app)
      super(app, "Hello, World!", :width => 800, :height => 600)
      tabbook = FXTabBook.new(self, :opts => LAYOUT_FILL) 
      student_tab = FXTabItem.new(tabbook, " Students ")
      student_page = FXVerticalFrame.new(tabbook,:opts => FRAME_RAISED|LAYOUT_FILL)
      frame = FXVerticalFrame.new(student_page, :opts => LAYOUT_FILL)
      FXLabel.new(frame, "Source Text:" , :opts => LAYOUT_FILL_X)
      source_text = FXText.new(frame, :opts => LAYOUT_FILL)
      FXLabel.new(frame, "Translated text:" , :opts => LAYOUT_FILL_X)
      translated_text = FXText.new(frame, :opts => TEXT_READONLY|LAYOUT_FILL)
      controls = FXHorizontalFrame.new(frame, :opts => LAYOUT_FILL_X)
      FXLabel.new(controls, "Translate from:" )
      translations = FXComboBox.new(controls, 15,
      :opts => COMBOBOX_STATIC|FRAME_SUNKEN|FRAME_THICK)
      translate_button = FXButton.new(controls, "Translate" ,
      :opts => BUTTON_NORMAL|LAYOUT_RIGHT) 
      
      
      
      contact_tab = FXTabItem.new(tabbook, " Tab1 ")
      contact_page = FXVerticalFrame.new(tabbook,:opts => FRAME_RAISED|LAYOUT_FILL)
      extras_tab = FXTabItem.new(tabbook, " Tab2 ")
      extras_page = FXVerticalFrame.new(tabbook,:opts => FRAME_RAISED|LAYOUT_FILL)
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
