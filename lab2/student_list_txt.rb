require_relative 'Student_list_Base.rb'
require 'json'
class Student_List_TXT<Student_List_Base
  public_class_method :new

  protected
  def str_to_hash_list(str)
    hash_list=[]
    str.each_line do |x|
      hash={}
      x.split(',').each do |pair|
        key,value = pair.split(':',2).map(&:strip)
        hash[key.to_sym] = value
        end
      hash_list<<hash
    end
    hash_list
  end

  def hash_list_to_str(hash_list)
    str = hash_list.map do
      |hash| hash.map{|key,value| "#{key}:#{value}"}.join(',')
    end
    str.join("\n")
  end

end
