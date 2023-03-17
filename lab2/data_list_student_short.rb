require_relative 'data_list'

class Data_list_Student_Short < DataList
  public_class_method :new

  def initialize(collection)
    super(collection)
  end

  def get_names
    ["lastname_initials", "git", "contact"]
  end

  protected

  def get_fields_from_datatable(object)
    [object.lastname_initials,object.git,object.contact]
  end

end