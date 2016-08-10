class Employee

  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end



class Manager < Employee

  attr_accessor :manager, :employees, :name, :title, :salary #, :boss

  def initialize(name, title, salary, manager)
    @name = name
    @title = title
    @salary = salary
    @manager = manager
    @employees = []
  end

  def add_employee(e)
    @employees << e
  end

  def bonus(multiplier)
    employee_sals = @employees.flatten.map {|employee| employee.salary}
    employee_sals.inject(:+) * multiplier
  end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)


darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
darren.add_employee(david)
darren.add_employee(shawna)
ned.add_employee(darren.employees)
ned.add_employee(darren)



p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
