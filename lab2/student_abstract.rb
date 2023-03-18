  class Student_basis
    private_class_method :new
    def contact?
      !email.nil? || !phone.nil? || !telegram.nil?
    end
    def validate?
      !git.nil? && contact?
    end

    public
    attr_reader :phone, :telegram, :email, :contact

    public
    attr_reader :id
    attr_reader :git
    def initialize( id:nil, phone:nil, telegram:nil, email:nil, git:nil,contact:nil)
      self.id= id
      @phone = phone
      @telegram = telegram
      @email = email
      @contact = get_contacts
      self.git = git

    end
    def get_contacts
      return " telegram:#{telegram}" unless telegram.nil?
      return " email: #{email}" unless email.nil?
      return " phone: #{phone}" unless phone.nil?
      nil
    end
    # Метод возвращающий один из контактов связи либо nil

    #def git=(git)
    # raise ArgumentError,"Некорретный ввод: git = #{git} !!!" unless Student_basis.is_val_git?(git) || git.nil?
    # @git = git
    #end
    def id=(id)
      raise ArgumentError,"Некорретный ввод: id = #{id} !!!" if id == Integer and id < 0
      @id = id
    end
  end
