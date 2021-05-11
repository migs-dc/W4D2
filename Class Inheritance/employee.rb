
class Employee
    attr_reader :salary

    def initialize(name, salary, title, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss 
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end
end





