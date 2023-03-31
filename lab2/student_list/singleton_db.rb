class Singleton
    
    @instance_mutex = Mutex.new

    private_class_method :new

    

    def initialize
    end

    def self.instance
        return @instance if @instance
    
        @instance_mutex.synchronize do
          @instance = @instance || new
        end
    
        @instance
      end

end