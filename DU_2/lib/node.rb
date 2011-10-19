# To change this template, choose Tools | Templates
# and open the template in the editor.

class Node
  
  def initialize
    @item
    @sousedi = []
    @stav = 'FRESH'
    @pocet = 0
  end
  
  def set_item(item)
    @item = item
  end
  
  def get_item()
    return @item
  end
  
  def set_soused(item)
    @sousedi.push(item)
  end
  
  def get_sousedi()
    return @sousedi
  end
  
  def get_soused_fresh()
      for n in sousedi
        if(n.get_stav == 'FRESH')
          return n
        end
      end
      return nil
  end
  
    def get_stav()
      return @stav
    end
    
    def set_stav(stav)
      @stav = stav
    end
    
    def set_pocet_pred(pocet)
      @pocet = pocet
    end
    
    def get_pocet_pred()
      return Integer(@pocet)
    end
end
