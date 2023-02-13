class Student
  attr_accessor :lastname, :firstname, :father_name, :id, :phone, :telegram, :email, :git
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