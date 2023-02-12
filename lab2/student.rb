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
end