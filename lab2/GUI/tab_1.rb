require 'glimmer-dsl-libui'
class TabStudents
    include Glimmer::LibUI::CustomControl
  
    body {
      horizontal_box {
        # Секция 1
  
        # Секция 3
        vertical_box {
          stretchy true
  
          button('Добавить') { stretchy false }
          button('Изменить') { stretchy false }
          button('Удалить') { stretchy false }
          button('Обновить') { stretchy false }
        }
      }
    }
end