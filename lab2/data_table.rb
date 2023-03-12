class DataTable
  attr_reader :rows_count, :cols_count


  def initialize(table)
    self.rows_count = table.size
    columns = 0
    table.each { |row| columns = row.size if row.size>columns }
    self.cols_count = columns
    self.table = table
  end

  def get_item(row,col)
    return nil if rows_count < row || row < 0
    return nil if cols_count < col || col < 0

    table[row][col]
  end

  def to_s
    "table:#{table}"
  end

  private
  attr_accessor :table
  attr_writer :rows_count, :cols_count
end