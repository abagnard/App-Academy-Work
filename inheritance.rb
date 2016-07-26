class Employee
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
  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    employees_sum = @employees.inject(0) {|sum, person| sum += person.salary}
    employees_sum * multiplier
  end
end

class Founder < Employee
  def initialize(name, title, salary)
    super(name, title, salary)
    @employees = []
  end

  def all_employees
    @employees.each do |person|
      person.employees.each {|person2| @employees << person2}
    end    
  end
end


ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

darren.employees << shawna << david
ned.employees << darren

darren.bonus(4)
ned.bonus(5)
david.bonus(3)
