class Student
  #сеттеры и гетторы
  attr_accessor :lastname, :firstname, :father_name, :id, :telegram, :email, :git
  attr_reader :phone
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


  #validation
  def self.is_val_phone?(phone)
    phone =~ /^\+?[7|8].?\(?\d{3}\)?\-?\d{3}\-?\d{2}\-?\d{2}$/
  end
  #setter
  def phone=(phone)
    raise ArgumentError,'Некорретный ввод: phone !!!'unless Student.is_val_phone?(phone)
    @phone = phone
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