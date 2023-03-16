require 'json'
require_relative 'student_abstract'


class Student_short < Student_basis
  public_class_method :new
  public 'get_contacts'


  attr_reader :lastname_initials

  def self.from_student(student)
    raise ArgumentError,"Нет ID" if student.id.nil?
    Student_short.new(student.id, student.get_info)
    to_s = student.get_info
  end

  def initialize(id,str)
    options = JSON.parse(str).transform_keys(&:to_sym)
    raise ArgumentError, "Нет ФИО!!!" if options[:lastname_initials].nil?
    self.id = id
    @lastname_initials = options[:lastname_initials]
    self.git = options[:git]
    params ={}
    params[:git] = git
    params[:id] = id
    con = options[:contact].split(":")

    if con[0] = "phone" then params[:phone] = con[1]
    elsif con[0]="telegram" then params[:telegram] = con[1]
    elsif con[0] = "email" then params[:email] = con[1]
    end
    super(**params)

  end

  def short_contact
    get_contacts
  end

end
