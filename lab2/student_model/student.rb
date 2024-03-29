require 'json'
require_relative '../student_model/student_abstract'
class Student < Student_basis
  # Делаем Student_basis публичным
  public_class_method :new

  # Делаем публичными геттеры и сеттеры абстрактного класса
  public 'id='
  # Стандартные геттеры для полей
  attr_reader :lastname, :firstname, :father_name

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
  def self.is_val_phone?(phone)
    phone =~ /^\+?[7|8].?\(?\d{3}\)?\-?\d{3}\-?\d{2}\-?\d{2}$/
  end

  def initialize(lastname:, firstname:,father_name:,id:nil,phone:nil,git:nil,telegram:nil,email:nil)
    self.lastname=lastname
    self.firstname=firstname
    self.father_name = father_name
    self.phone = phone
    self.git = git
    self.id = id
    self.telegram = telegram
    self.email = email
    super(id:id,git:git,email:email,telegram:telegram,phone:phone)
  end
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

  def set_contacts(contacts)
    self.phone = contacts[:phone] unless contacts[:phone].nil?
    self.telegram = contacts[:telegram] unless contacts[:telegram].nil?
    self.phone = contacts[:email] unless contacts[:email].nil?
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

  def self.from_hash(hash)
    raise ArgumentError, '"У вас проблема с обязательными полями !!!"' unless hash.key?(:firstname) && hash.key?(:lastname) && hash.key?(:father_name)
    Student.new( **hash)
  end

  #метод создающий объект из строки
  def self.from_json(str)
    options = JSON.parse(str)
    from_hash(options)
  end

  def self.read_from_txt(filepath)
    student_list=[]
    if File.exist?(filepath)
      file = File.new(filepath,"r:UTF-8")
      content = file.readlines
      content.each { |str| student_list<<from_json(str) }
    else
      raise ArgumentError,"Путь к файлу: #{filepath} не существует"
    end
    student_list
  end

  def self.write_to_txt(filepath,student_list)
    file = File.new(filepath,"w")
    student_list.each { |student| file.write("#{student.to_json}\n") }
    file.close
  end
  # метод представляющий объект в виде строки
  def to_json
    JSON.generate(to_hash)
  end

  def to_hash
    attrs = {}
    %i[lastname firstname father_name id phone telegram email git].each do |attr|
      attr_val = send(attr)
      attrs[attr] = attr_val unless attr_val.nil?
    end
    attrs
  end

  # Метод возвращающий краткую инфу об объекте
  def get_info
    info={}
    info[:lastname_initials] = "#{lastname} #{firstname[0]} #{father_name[0]}"
    info[:git] = git unless git.nil?
    info[:contact] = contact unless contact.nil?
    JSON.generate(info)
  end
end


##^[a-zA-Z\d\.]+@[a-z\d\.]+    gmail
# ^\+?[7|8].?\(?\d{3}\)?\-?\d{3}\-?\d{2}\-?\d{2}$ phone
#^[А-Я][а-я]+ - имя фамилия отчество
#