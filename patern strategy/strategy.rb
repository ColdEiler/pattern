
class Navigator
  attr_accessor :strategy

  def initialize(strategy)
    self.strategy = strategy
  end

  def how_get_in
    strategy.do_get_in
  end

end

class Strategy
  def do_get_in

  end
end

class Walk<Strategy
  def do_get_in
    puts"тебе лучше иди"
  end
end

class Tram<Strategy
  def do_get_in
    puts "Трамвай это база"
  end
end

class Taxi<Strategy
  def do_get_in
    puts "Ты богат?"
  end
end

me = Navigator.new(Tram.new)
me.how_get_in

she = Navigator.new(Taxi.new)
she.how_get_in

