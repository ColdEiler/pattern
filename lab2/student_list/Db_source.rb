class DB_Source
    private_class_method :new
    @instance_mutex = Mutex.new

    def initialize
        @db = SQLite3::Database.open("C:/Users/Владислав/OneDrive - FGBOU VO Kubanskiy Gosudarstvennyi Universitet/Рабочий стол/labs/lab2/student.db")      
    end

    def self.instance
        return @instance if @instance
        @instance_mutex.synchronize do
          @instance ||= new
        end
        @instance
    end

    def exec(command, *params)
        @db.execute(command,*params)
    end    

end