require 'json'
require_relative 'student_abstract'
class Student < Student_basis
  # Делаем Student_basis публичным
  public_class_method :new

  # Делаем публичными геттеры и сеттеры абстрактного класса
  public :phone, :telegram, :email, 'id=', 'phone=', 'telegram=', 'email=', 'git='
  # Стандартные геттеры для полей
  attr_reader :last_name, :first_name, :father_name

  def initialize(lastname:, firstname:,father_name:)
    self.lastname=lastname
    self.firstname=firstname
    self.father_name = father_name
    super(id:id,phone:phone,telegram: telegram, email:email,git:git)
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

    Student.new(lastname:lastname,firstname:firstname,father_name:father_name,)
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

  # Метод возвращающий один из контактов связи либо nil
  def get_concats
    return " telegram:#{telegram}" unless telegram.nil?
    return " email: #{email}" unless email.nil?
    return " phone: #{phone}" unless phone.nil?
    nil
  end

  # Метод возвращающий краткую инфу об объекте
  def get_info
    infa = "lastname_initials: #{lastname} #{firstname[0]} #{father_name[0]}"
    infa += get_concats unless get_concats.nil?
    infa+=get_git unless get_git.nil?
    infa
  end
end


##^[a-zA-Z\d\.]+@[a-z\d\.]+    gmail
# ^\+?[7|8].?\(?\d{3}\)?\-?\d{3}\-?\d{2}\-?\d{2}$ phone
#^[А-Я][а-я]+ - имя фамилия отчество
#