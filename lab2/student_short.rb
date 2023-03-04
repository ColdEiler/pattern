require_relative 'student_abstract'

class Student_short<Student_basis
  attr_accessor :lastname_initials,:contact,:id,:git

  public_class_method :new
  def self.from_student(student)
    raise ArgumentError,"Нет ID" if student.id.nil?
    Student_short.new(student.id, student.get_info)
  end

  def initialize(id,str)
    options = JSON.parse(str).transform_keys(& to_sym)
    raise ArgumentError, "Нет ФИО!!!" if options[:lastname_initials].nil?

    self.id = id
    self.lastname_initials = options[:lastname_initials]
    self.contact = options[:contact]
    self.git = options[:git]

    super(id:self.id,git:self.git)
  end

  def to_s
    res = lastname_initials
    res += id
    [:contact,:git].each do |option|
      opt_val = send(option)
      res+= "#{option}: #{opt_val}" unless opt_val.nil?
    end
    res
  end
end