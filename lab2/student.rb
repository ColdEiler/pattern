class Student
  #сеттеры и гетторы
  attr_accessor :lastname, :firstname, :father_name, :id
  attr_reader :phone, :telegram, :email, :git

  #validation
  def self.is_val_phone?(phone)
    phone =~ /^\+?[7|8].?\(?\d{3}\)?\-?\d{3}\-?\d{2}\-?\d{2}$/
  end

  def self.is_val_email?(email)
    email =~ /^[a-zA-Z\d\.]+@[a-z\d\.]+/
  end

  def self.is_val_git?(git)
    git=~ /[A-Za-z0-9-_]+$/
  end

  def self.is_val_telegram?(telegram)
    telegram =~ /@[A-Za-z0-9-_]+$/
  end

  def self.is_val_name?(name)
    name=~/^[А-Я][а-я]+/
  end
  def initialize(lastname, firstname,father_name,options={})
    self.lastname=lastname
    self.firstname=firstname
    self.father_name = father_name
    self.id=options[:id]
    self.phone=options[:phone]
    self.telegram=options[:telegram]
    self.email=options[:email]
    self.git=options[:git]
  end


  #setter
  def lastname=(lastname)
    raise ArgumentError,'Некорретный ввод: lastname !!!'unless Student.is_val_name?(lastname)
    @lastname = lastname
  end

  def firstname=(firstname)
    raise ArgumentError,'Некорретный ввод: firstname !!!'unless Student.is_val_name?(firstname)
    @firstname = firstname
  end

  def father_name=(father_name)
    raise ArgumentError,'Некорретный ввод: father_name !!!'unless Student.is_val_name?(father_name)
    @father_name = father_name
  end
  def phone=(phone)
    raise ArgumentError,'Некорретный ввод: phone !!!'unless Student.is_val_phone?(phone)
    @phone = phone
  end
  def email=(email)
    raise ArgumentError,'Некорретный ввод: email !!!'unless Student.is_val_email?(email)
    @email = email
  end
  def telegram=(telegram)
    raise ArgumentError,'Некорретный ввод: telegram !!!'unless Student.is_val_telegram?(telegram)
    @telegram = telegram
  end
  def git=(git)
    raise ArgumentError,'Некорретный ввод: git !!!'unless Student.is_val_git?(git)
    @git = git
  end

  def to_s
    res = "#{self.lastname} #{self.firstname} #{self.father_name}"
    res+= " id = #{self.id}" unless id.nil?
    res+= " phone = #{self.phone}" unless phone.nil?
    res+= " telegram = #{self.telegram}" unless telegram.nil?
    res+= " email = #{self.email}" unless email.nil?
    res+= " git = #{self.git}" unless git.nil?
    res
  end

end


##^[a-zA-Z\d\.]+@[a-z\d\.]+    gmail
# ^\+?[7|8].?\(?\d{3}\)?\-?\d{3}\-?\d{2}\-?\d{2}$ phone
#^[А-Я][а-я]+ - имя фамилия отчество
#