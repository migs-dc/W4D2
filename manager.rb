require_relative "employee"

class Manager < Employee 

    attr_reader :employees

    def initialize(name, salary, title, boss)
        super(name, salary, title, boss=nil)
        @employees = []
        # super(@boss = nil)
    end

    def add_employees(employee)
        @employees << employee
    end

    def bonus(multiplier)
        total = 0
        @employees.each do |employee|
            total += employee.salary

            if employee.is_a? Manager 
                employee.employees.each do |employee_2|
                    total += employee_2.salary
                end
            end             
        end
        total * multiplier
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
p first.bonus(3) # => 30_000
