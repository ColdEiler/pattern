class Student_basis
  private_class_method :new

  def self.is_val_git?(git)
    git=~ /[A-Za-z \d\-]+$/
  end

  public
  attr_reader :id
  attr_reader :git
  def initialize( id:nil, git:nil)
    self.id= id
    self.git = git
  end


  # Метод возвращающий один из контактов связи либо nil

  def git=(git)
    raise ArgumentError,"Некорретный ввод: git = #{git} !!!" unless Student_basis.is_val_git?(git) || git.nil?
    @git = git
  end

  def id=(id)
    raise ArgumentError,"Некорретный ввод: id = #{id} !!!" if id == Integer and id < 0
    @id = id
  end
end