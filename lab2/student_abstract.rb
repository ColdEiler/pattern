class Student_basis
  private_class_method :new

  def self.is_val_phone?(phone)
    phone =~ /^\+?[7|8].?\(?\d{3}\)?\-?\d{3}\-?\d{2}\-?\d{2}$/
  end

  def contact?
    !email.nil? || !phone.nil? || !telegram.nil?
  end
  def validate?
    !git.nil? && contact?
  end
  def self.is_val_email?(email)
    email =~ /^[a-zA-Z\d\.]+@[a-z\d\.]+/
  end

  def self.is_val_git?(git)
    git=~ /[A-Za-z \d\-]+$/
  end

  def self.is_val_telegram?(telegram)
    telegram =~ /^@[A-Za-z0-9_\-]+$/
  end

  def self.is_val_name?(name)
    name=~/^[А-Я][а-я]+/
  end

  protected
  attr_writer :id
  attr_reader :phone, :telegram, :email

  public
  attr_reader :id
  attr_reader :git
  def initialize( id:nil, phone:nil, telegram:nil, email:nil, git:nil)
    self.id= id
    self.phone = phone
    self.telegram = telegram
    self.email = email
    self.git = git
  end

  def get_concats
    return " telegram:#{telegram}" unless telegram.nil?
    return " email: #{email}" unless email.nil?
    return " phone: #{phone}" unless phone.nil?
    nil
  end


  # Метод возвращающий один из контактов связи либо nil

  #setter
  def phone=(phone)
    raise ArgumentError,"Некорретный ввод: phone = #{phone}!!!" unless Student.is_val_phone?(phone) || phone.nil?
    @phone = phone
  end
  def email=(email)
    raise ArgumentError,"Некорретный ввод: email = #{email} !!!" unless Student.is_val_email?(email) || email.nil?
    @email = email
  end
  def telegram=(telegram)
    raise ArgumentError,"Некорретный ввод: telegram = #{telegram} !!!" unless Student.is_val_telegram?(telegram) || telegram.nil?
    @telegram = telegram
  end
  def git=(git)
    raise ArgumentError,"Некорретный ввод: git = #{git} !!!" unless Student.is_val_git?(git) || git.nil?
    @git = git
  end

end