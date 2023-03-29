require_relative '../student_list/student_list_Base'
require_relative 'DataToFileStrategy'
require 'json'
class Student_List_JSON<DataToFileStrategy
  public_class_method :new

  def str_to_hash_list(str)
    JSON.parse(str,{symbolize_names: true})
  end

  def hash_list_to_str(hash_list)
    JSON.pretty_generate(hash_list)
  end

end
