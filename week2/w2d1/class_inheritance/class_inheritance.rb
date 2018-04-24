# require 'byebug'

class Employee
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier = 1)
    salary * multiplier
  end

  def your_salary
    salary
  end

  protected
  attr_reader :name, :title, :salary, :boss

end

class Manager < Employee


  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier = 1)
    sum_employee_salary * multiplier
  end

  def sum_employee_salary
    ans = 0
    @employees.each do |emp|
      if emp.is_a?(Manager)
        ans += (emp.bonus + emp.salary)
        p "M=#{ans}"
      else
        ans += emp.bonus
        p "E=#{ans}"
      end
    end
    ans
  end

  private
  attr_reader :employees
end

dave = Employee.new("David", "TA", 10_000, "Darren")
shawna = Employee.new("Shawna", "TA", 12_000, "Darren")
# p dave
darr = Manager.new("Darren", "TA Manager", 78_000, "Ned", [shawna, dave])
ned = Manager.new("Ned", "Founder", 1_000_000, nil, [darr])
# p darr
p ned.bonus(5)
p darr.bonus(4)
p dave.bonus(3)
