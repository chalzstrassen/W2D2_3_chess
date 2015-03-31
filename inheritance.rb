class Employee

  attr_accessor :name, :title, :salary, :boss

    def initialize (name, title, salary, boss=nil)
      @name = name
      @title = title
      @salary = salary
      @boss = boss
    end

    def bonus(multiplier)
      salary * multiplier
    end

    def subordinates_salary
      0
    end



end

class Manager < Employee

  attr_accessor :subordinates

  def initialize(name, title, salary)
    super(name, title, salary)
    @subordinates = []
  end

  def bonus(multiplier)
    subordinates_salary * multiplier
  end

  def add_subordinate(employee)
    employee.boss = self
    @subordinates << employee
  end

  def subordinates_salary
    return self.salary if @subordinates.nil?
    total = 0
    @subordinates.each do |subordinate|
      total = subordinate.salary + subordinate.subordinates_salary
    end
    total
  end

end
