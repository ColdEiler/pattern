# frozen_string_literal: true

require 'glimmer-dsl-libui'

class HelloWindow
    include Glimmer
    def create 
        window('Приложение для работы с студентами',600,400){
            tab{
                tab_item ('Студенты'){
                    
                }
                tab_item('tab2'){}
                tab_item('tab3'){}
                
            }
        }
    end

end

main_window = HelloWindow.new.create
main_window.show