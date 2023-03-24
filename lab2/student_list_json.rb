require_relative 'Student_list_Base.rb'
require 'json'
class Student_List_JSON<Student_List_Base
  public_class_method :new

  protected
  def str_to_hash_list(str)
    JSON.parse(str,{symbolize_names: true})
  end

  def hash_list_to_str(hash_list)
    JSON.pretty_generate(hash_list)
  end

end
