class DataList
  private_class_method :new

  attr_writer :list
  def initialize(collection)
    self.list = collection
    self.selected_objects = []
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def notify
    @observers.each{|observer| observer.datalist_changed(data)}
  end

  def select(id)
    return selected_objects<< id  if id < list.size
    nil
  end

  def get_selected
    id_list=[]
    selected_objects.each{|id| id_list << id }
    id_list
  end

  #template_method
  def get_data
    data = []
    row_count = 0
    list.each do
    |object|
      row = []
      row<<row_count
      row.push(*get_fields_from_datatable(object))
      data<<row
      row_count+=1
    end
    DataTable.new(data)
  end
  protected
  def get_names
    []
  end
  #реализация в потомках
  def get_fields_from_datatable(object)
    []
  end

  private
  attr_reader :list
  attr_accessor :selected_objects

end