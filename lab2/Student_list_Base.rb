require_relative 'student'
class Student_List_Base
  private_class_method :new

  attr_accessor :students, :slb_id
  def initialize
    self.students = []
    self.slb_id = 1
  end

  def read_from_file(filepath)
    raise ArgumentError,"Файла не существует!!!" unless File.exist?(filepath)
    objects_list = str_to_hash_list(File.read(filepath))
    self.students = objects_list.map{|h| Student.from_hash(h)}
    update_id
  end

  def write_to_file(filepath)
    raise ArgumentError,"Файла не существует!!!" unless File.exist?(filepath)
    objects_list = students.map(&:to_hash)
    File.write(filepath,hash_list_to_str(objects_list))
  end

  def get_k_n_student_short_list(k,n,data_list:nil)
    page = (k-1)*n
    students_page_list = students[page,n].map{|st| Student_short.new(st.id,st.get_info)}
    return  Data_list_Student_Short.new(students_page_list) if data_list.nil?
    data_list.append(students_page_list)
  end
  def student_by_id(student_id)
    students.detect{|stud| stud.id == student_id}
  end

  def sort_students
    students.sort_by(&lastname_initials)
  end

  def add_student(student)
    student.id = slb_id
    students << student
    self.slb_id += 1
  end

  def remove_student(student_id)
    students.reject{|stud| stud.id == student_id}
  end

  def replace_student(st_1,st_2)
    replace_index = students.find_index{|stud| stud.id == st_1.id}
    students[replace_index] = st_2
  end

  def get_student_short_count
    students.count
  end

  def update_id
    self.slb_id = students.max_by(&:id).id+1
  end

  protected
  def str_to_hash_list(str)
  end

  def hash_list_to_str(hash_list)
  end


end