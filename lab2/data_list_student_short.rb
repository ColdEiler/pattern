require_relative 'data_list'

class Data_list_Student_Short < DataList
  public_class_method :new

  def initialize(collection)
    super(collection)
  end

  def get_names
    ["lastname_initials", "git", "contact"]
  end

  def get_data
    data = []
    row_count = 0
    list.each do
      |object|
      data<<row_count
      data<<object.lastname_initials
      data<<object.git
      data<<object.contact

      row_count+=1
    end
    DataTable.new(data)
  end


end