require 'json'
require_relative 'student_abstract'

class Student_short<Student_basis
  # attr_accessor :lastname_initials,:contact,:id,:git


  public_class_method :new

  public
  attr_reader :lastname_initials

  def self.from_student(student)
    raise ArgumentError,"Нет ID" if student.id.nil?
    Student_short.new(student.id, student.get_info)
  end

  def initialize(id,str)
    options = JSON.parse(str).transform_keys(&:to_sym)
    raise ArgumentError, "Нет ФИО!!!" if options[:lastname_initials].nil?

    self.id = id
    @lastname_initials = options[:lastname_initials]
    self.git = options[:git]

  end

  def concats_short
    get_concats
  end

  def to_s
    res = lastname_initials
    [:git,:id].each do |option|
      opt_val = send(option)
      res+= " #{option}: #{opt_val}" unless opt_val.nil?
      res+="concat: #{get_concats}"
    end
    res
  end
end
