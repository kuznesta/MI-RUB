# To change this template, choose Tools | Templates
# and open the template in the editor.

require "node.rb"

class BFS
  
  def initialize
    @pole_node = Array.new
  end
  
  def run(pole, index)
    n=Node.new
    n = pole[index]
    bfs_projdi(n)
  end

  def bfs_projdi(n)
    fronta = Fifo.new    
    n.set_stav("OPEN")
    putc String(n.get_item)
    fronta.push(n)
    while(!fronta.empty)
      node = fronta.pop
      sousedi = node.get_sousedi
      for s in sousedi
        if(s.get_stav == "FRESH")
          s.set_stav("OPEN")
        #  puts String(s.get_item)
          print(" " + String(s.get_item))
          fronta.push(s)
        end
      end
      node.set_stav('CLOSE')
     end
  end
end

class Fifo
  def initialize
    @pole = Array.new()
  end
  
  def push(node)
    @pole.push(node)
  end
  
  def pop()
    if(@pole.length != 0)
    node = @pole.shift
    return node
    end
    return nil
  end
  
  def empty()
    if(@pole.length == 0)
    return true
    else
    return false
    end
  end
end