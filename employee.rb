require_relative "manager.rb"

class Employee

    attr_reader :salary

    def initialize(name, salary, title, boss)
        @name = name
        @title = title
        @salary = 0
        @boss = boss 
    end

    def bonus(mulitplier)
        bonus = @salary * mulitplier
    end
end

ned = Manager.new("Ned", 1000000, "Founder", nil)
darren = Manager.new("Darren", 78000, "TA Manager", ned)
first = Employee.new("David", 10000, "TA", darren)
second = Employee.new("Shawna", 12000, "TA", darren)

ned.add_employees(darren)
darren.add_employees(first)
darren.add_employees(second)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000

