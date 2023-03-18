require 'json'
require_relative 'student_abstract'

class Student_short < Student_basis
  public_class_method :new
  attr_reader :lastname_initials #,:id,:git,:contact


  def self.from_student(student)
    raise ArgumentError,"Нет ID" if student.id.nil?
    Student_short.new(student.id, student.get_info)
  end

  def initialize(id,str)
    options = JSON.parse(str).transform_keys(&:to_sym)
    raise ArgumentError, "Нет ФИО!!!" if options[:lastname_initials].nil?
    @id = id
    @lastname_initials = options[:lastname_initials]
    @git = options[:git]
    @contact = options[:contact]
  end

  def to_s
    res = "lastname_initials: #{lastname_initials}"
    [:id,:contact,:git].each do |option|
      opt_val = send(option)
      res+= " #{option}:#{opt_val} " unless opt_val.nil?
    end
    res
  end
end
