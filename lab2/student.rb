class Student
  #сеттеры и гетторы
  attr_accessor  :id
  attr_reader :phone, :telegram, :email, :git,:lastname, :firstname, :father_name

  #validation
  def self.is_val_phone?(phone)
    phone =~ /^\+?[7|8].?\(?\d{3}\)?\-?\d{3}\-?\d{2}\-?\d{2}$/
  end

  def contact?
    !email.nil? || !phone.nil? || !telegram.nil?
  end
  def validate
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
    raise ArgumentError,"Некорретный ввод: lastname = #{lastname} !!!" unless Student.is_val_name?(lastname) || lastname.nil?
    @lastname = lastname
  end

  def firstname=(firstname)
    raise ArgumentError,"Некорретный ввод: firstname = #{firstname}!!!" unless Student.is_val_name?(firstname) || firstname.nil?
    @firstname = firstname
  end

  def father_name=(father_name)
    raise ArgumentError,"Некорретный ввод: father_name = #{father_name} !!!" unless Student.is_val_name?(father_name) || father_name.nil?
    @father_name = father_name
  end
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