# To change this template, choose Tools | Templates
# and open the template in the editor.
#
#FORMAT
#1          -pocet grafu
#6          -pocet vrcholu
#1 2 3 4    -1 vrchol ma 2 sousedy uzly 3 a 6
#2 2 3 6
#3 2 1 2
#4 1 1
#5 0        -5 vrchol nema sousedy
#6 1 2
#5 1        -zacatek od 5 a 0-DFS 1-BFS
#1 0        -zacatel od 1 DFS
#1 0
#0 0        - konec
#

require 'stack.rb'
require 'node.rb'
require 'DFS.rb'
require 'BFS.rb'

#nacitani souboru
f = File.open('..\\TEST.txt')
a = f.readlines

pocet_grafu  = Integer(a[0])
radek = 1

for g in 1..pocet_grafu
print("graf " + String(g)+"\n")
pole_n = Array.new
pole_n[0] = Node.new
#inicializace pole hodnot
poc_vrch = Integer(a[radek])

#inicializace pole s vrcholy
for i in 1..poc_vrch
  n = Node.new
  n.set_item(i)
  pole_n[i] = n
end

#nastaveni sousedu
for i in 1..poc_vrch
  n = pole_n[i]
  radek +=1
  
  line = a[radek].split(' ')
  n.set_item(line[0])
  n.set_pocet_pred(line[1])
  index = 2
  for j in 0.. n.get_pocet_pred-1
    l = Integer(String(line[index]))
    pom = pole_n[l]
    n.set_soused(pom)
    index +=1
   end
 end
 
  #nacitani ulohy
  radek += 1
  line = a[radek].split(' ')
  beh = true
  while(beh)
  if(line[0] == '0' && line[1] == '0')
    beh = false
  end
     for s in pole_n
     s.set_stav("FRESH")
     end
    if(line[1] == '0'&& line[0] != '0')
      dfs = DFS.new
      dfs.run(pole_n,Integer(line[0]))
      puts "\n"
    end
    if(line[1] == '1'&& line[0] != '0')
      bfs = BFS.new
      bfs.run(pole_n,Integer(line[0]))
      puts "\n"
    end
    radek+=1
    if(a[radek] != nil)
    line = a[radek].split(' ')  
    end
    
  end
end

