require_relative 'drink'

class Coffee<Drink
  public_class_method :new
  protected
  def brew
    puts "Готовим кофе"
  end

  def add_condiments
    puts "Добавим молока и сахар"
  end
end