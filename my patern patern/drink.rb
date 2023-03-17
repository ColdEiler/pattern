class Drink
  private_class_method :new
  def recipe
    boilWater
    brew
    pour_in_cup
    add_condiments
  end
  protected
  def boilWater
    puts "Вскипятим воду"
  end

  def pour_in_cup
    puts "Нальем в кружку"
  end

  def brew

  end
  def add_condiments

  end

end