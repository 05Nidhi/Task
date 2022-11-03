$globe="year"

class First
    @@classVar="classvar"

    puts("First: global variable #{$globe}")
    

    def initialize
        puts("First: initialoze method")
    end
    def first_method
        puts("First: first_method #{@@classVar}")
        month="month"
        puts("First: local variable #{month}")
    end
    def second_method
        puts("First: second_method #{@@classVar}")
    end
end
# obj1=First.new
# obj1.first_method
# puts(obj1.second_method)

class Second
    @@abc="test"
    puts("Second: global variable #{$globe}")
    puts("Second: class variable #{@@abc}")

    def initialize(x)
        @namevar= x
        puts("Second: initialoze method #{x}")

        # puts("Second: instance variable #{@namevar}")
    end


    def first_method
        puts("Second: instance variable #{@namevar}")

    end

    def self.classmethod

        puts("Second: hey!its class method")
    end
end


obj2=Second.new("obj2")
obj2.first_method
puts(Second.classmethod)


obj3 = Second.new("obj3")
obj3.first_method
