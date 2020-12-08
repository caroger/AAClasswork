class Employee

  attr_reader :salary

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
    total = 0
    @employees.each do |employee|
      total += employee.salary * multiplier
    end
    total
  end

  def add_employee(*another_employee)
    @employees += another_employee
  end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager",78000, ned)

david = Employee.new("David", "TA", 10000, darren)
shawna = Employee.new("Shawna", "TA", 12000, darren)

darren.add_employee(david)
darren.add_employee(shawna)
ned.add_employee(darren, shawna, david)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)