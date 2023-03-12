class DataList
  private_class_method :new

  def initialize(collection)
    self.list = collection
    self.selected_objects = []
  end

  def select(id)
    return selected_objects.<< id  if id < list.size
    nil
  end

  def get_selected
    id_list=[]
    list.each{|object| id_list << object.id }
    id_list
  end

  def get_names
    []
  end

  def get_data
    []
  end

  private
  attr_accessor :list,:selected_objects

end