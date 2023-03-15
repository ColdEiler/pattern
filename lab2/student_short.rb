require 'json'
require_relative 'student_abstract'


class Student_short<Student_basis
  # attr_accessor :lastname_initials,:contact,:id,:git
  public_class_method :new
  attr_reader :lastname_initials,:id,:git,:contact


  def self.from_student(student)
    raise ArgumentError,"Нет ID" if student.id.nil?
    Student_short.new(student.id, student.get_info)
    to_s = student.get_info
  end

  def initialize(id,str)
    options = JSON.parse(str).transform_keys(&:to_sym)
    raise ArgumentError, "Нет ФИО!!!" if options[:lastname_initials].nil?
    @id = id
    @lastname_initials = options[:lastname_initials]
    @git = options[:git]
    @contact = options[:contact]

  end

end
