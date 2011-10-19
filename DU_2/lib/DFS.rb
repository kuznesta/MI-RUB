# To change this template, choose Tools | Templates
# and open the template in the editor.

#DFS struktura
require "node.rb"

class DFS
  
  def initialize
    @pole_node = Array.new()
  end
  
  def set_pole_node(pole)
    @pole_node = pole
  end
  
  def run(pole, index)
    set_pole_node(pole)
    np = Node.new
    np = pole[index]    
    dfs_projdi(np)    
  end
  
  def dfs_projdi(n)
    n.set_stav('OPEN')
  #  puts String(n.get_item)
    print(String(n.get_item) + " ")
    sousedi = n.get_sousedi
        
    for s in sousedi
      if(s.get_stav == 'FRESH')
        dfs_projdi(s)
      else
      s.set_stav('CLOSE')
      end
    end
  end
end

=begin
for n in @pole_node
      np = n
      if(np.get_stav == 'FRESH')
        dfs_projdi(np)
      end
    end
=end