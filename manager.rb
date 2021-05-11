require_relative "employee.rb"

class Manager < Employee 

    def initialize
        @employees = []
        super(@boss = nil)
    end

    def add_employees(employee)
        @employees << employee
    end

    def bonus(mulitplier)
        total = 0
        @employees.each do |employee|
            if employee.is_a? Manager 
                employee.employees.each do |employee_2|
                    total += employees_2.salary
                end
            else 
                total += employee.salary 
            end
        end
        total * mulitplier
    end
end

