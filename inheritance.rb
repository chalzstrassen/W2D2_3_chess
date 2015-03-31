class Employee

  attr_accessor :name, :title, :salary, :boss

    def initialize (name, title, salary, boss=nil)
      @name = name
      @title = title
      @salary = salary
      @boss = boss
    end

end

class Manager < Employee

  attr_accessor :subordinates

  def initialize(name, title, salary)
    super(name, title, salary)
    @subordinates = []
  end

  def add_subordinate(employee)
    employee.boss = self
    @subordinates << employee
  end

end
