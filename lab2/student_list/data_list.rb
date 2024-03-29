class DataList
  private_class_method :new
  attr_reader :list

  def initialize(collection)
    self.list = collection
  end

  def select(id)
    return selected_objects<< id  if id < list.size
    nil
  end

  def [](other)
    self.list[other]
  end


  def list=(collection)
    raise ArgumentError, "not array" if collection.class != Array
    @list = collection
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
  attr_accessor :selected_objects

end