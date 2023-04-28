require_relative '../student_list/data_list'

class Data_list_Student_Short < DataList
  public_class_method :new

  def initialize(collection)
    super(collection)
    @observers = []
  end

  def add_observer(observer)
    @observers<<observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end
  
  def notify
    if @observers
      @observers.each do |observer|
        observer.set_table_data(get_data())
      end
    end
  end
 
  def get_names
    ["lastname_initials", "git", "contact"]
  end

  def list=(collection)
    super
    notify()
  end

  protected

  def get_fields_from_datatable(object)
    [object.id, object.lastname_initials,object.git,object.contact]
  end

end