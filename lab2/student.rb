require 'json'
require_relative 'student_abstract'
class Student < Student_basis
  # Делаем Student_basis публичным
  public_class_method :new

  # Делаем публичными геттеры и сеттеры абстрактного класса
  public  'git=','get_concats','id='
  # Стандартные геттеры для полей
  attr_reader :lastname, :firstname, :father_name
  def self.is_val_email?(email)
    email =~ /^[a-zA-Z\d\.]+@[a-z\d\.]+/
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
    super(id:id,phone:phone,telegram: telegram, email:email,git:git)
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

  #метод создающий объект из строки
  def self.from_json(str)
    options = JSON.parse(str)
    firstname = options["firstname"]
    lastname = options["lastname"]
    father_name = options["father_name"]
    raise ArgumentError, "У вас проблема с обязательными полями !!!" if firstname.nil? || lastname.nil? || father_name.nil?

    phone = options["phone"]
    git = options["git"]
    email = options["email"]
    telegram = options["telegram"]
    id = options["id"]

    Student.new(lastname:lastname,firstname:firstname,father_name:father_name,id:id,git:git,email:email,telegram:telegram,phone:phone)
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
  # метод представляющий объект в виде строки
  def to_json
    options={}
    [:lastname,:firstname,:father_name,:id,:phone, :telegram,
     :email,:git].each do |attr|
      attr_val = send(attr)
      options[attr] = attr_val unless attr_val.nil?
    end
    JSON.generate(options)
  end


  # Метод возвращающий краткую инфу об объекте
  def get_info
    info={}
    info[:lastname_initials] = "#{lastname} #{firstname[0]} #{father_name[0]}"
    info[:git] = git unless git.nil?
    info[:contact] = get_concats unless get_concats.nil?
    JSON.generate(info)
  end
end


##^[a-zA-Z\d\.]+@[a-z\d\.]+    gmail
# ^\+?[7|8].?\(?\d{3}\)?\-?\d{3}\-?\d{2}\-?\d{2}$ phone
#^[А-Я][а-я]+ - имя фамилия отчество
#