# To change this template, choose Tools | Templates
# and open the template in the editor.

#Trida zasobnik

class Stack
    def initialize
      @stack = []
    end
    
    def push(item)
      @stack.push(item)
    end
    
    def pop(item)
      @stack.pop(item)      
    end
    
    def count
      @stack.length
    end
    
    def clear
      @stack.clear
    end
    
end
