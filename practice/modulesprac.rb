# Define a module with a method
module Greeting
    def say_hello
      puts "Hello, world!"
    end
end
  
# Use the module by including it in a class
class MyClass
  include Greeting
end
  
# Create an instance of MyClass and call the method
obj = MyClass.new
obj.say_hello # Output: "Hello, world!"


module Mymod
    module Math
      def self.add(x, y)
        x + y
      end
  
      def self.subtract(x, y)
        x - y
      end
    end
end
  
puts Mymod::Math.add(2, 3) #=> 5
  