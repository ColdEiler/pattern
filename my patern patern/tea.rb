require_relative 'drink'

class Tea<Drink
  public_class_method :new
  protected
  def brew
    puts("Завариваем чай")
  end

  def add_condiments
    puts "Добавим лимон"
  end

end