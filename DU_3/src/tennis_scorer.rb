require File.expand_path(File.dirname(__FILE__) + '/roman')

class TennisScorer

  attr_accessor :server, :receiver

  def initialize
    @value = ['0','-','0']
    @server = Server.new
    @receiver = Receiver.new
  end

  def score
    vysl = ""

    if(@server.value == "0")
      @value[0] = "0"
    else
      @value[0] = Roman.new(Integer(@server.value)).to_s
    end

    if(@receiver.value == "0")
       @value[2] = "0"
    else
       @value[2] = Roman.new(Integer(@receiver.value)).to_s
    end

     for s in @value
        vysl += s.to_s
      end

    return vysl
  end

  def winner

    if(@server.set_winner && @receiver.set_winner)
      return "unexpected value"
    end

    if(@server.set_winner)
      return "server win"
    end

    if(@receiver.set_winner)
      return "receiver win"
    end
  end

  def Server_scoring
    @server.wins += 1

    case @server.wins

      when 1
        @server.value="15"
      when 2
        @server.value="30"
      when 3
        @server.value="40"
    end

    if(@server.wins == 4 && @receiver.wins < 3)
        @server.value = "0"
        @server.wins = 0
        @server.set_winner = true
        @receiver.wins=0
        @receiver.value="0"
      return
    end

  #  if(@server.wins == 4 && @receiver.value =="40" )
  #    @server.value="45"
  #  end

  #   if(@server.wins == 4 && @receiver.value =="45" )
  #    @server.value="40"
  #    @receiver.value="40"
  #  end

    if(@server.wins >= 4)

        if(@server.value=="45" && @receiver.value =="40")
        @server.value = "0"
        @server.wins = 0
        @server.set_winner = true
        @receiver.wins=0
        @receiver.value="0"
          return
        end

        if(@server.value=="40" && @receiver.value =="45")
         @server.value = "40"
         @receiver.value = "40"
          return
        end

       if(@server.value=="40" && @receiver.value =="40")
         @server.value = "45"
         @receiver.value = "40"
         return
        end

    end


  end #konec server_scoring

  def Receiver_scoring
    @receiver.wins += 1

      case @receiver.wins

        when 1
          @receiver.value="15"
        when 2
          @receiver.value="30"
        when 3
          @receiver.value="40"
      end

    if(@receiver.wins == 4 && @server.wins < 3)
          @receiver.value = "0"
          @receiver.wins = 0
          @receiver.set_winner = true
          @server.wins=0
          @server.value="0"
      return
    end

   # if(@receiver.wins == 4 && @server.value =="40")
   #      @receiver.value="45"
   # end

   # if(@receiver.wins == 4 && @server.value =="45")
   #      @receiver.value="40"
   #       @server.value = "40"
   # end

     if(@receiver.wins >= 4)

        if(@server.value == "40" && @receiver.value == "45")
        @receiver.value = "0"
        @receiver.wins = 0
        @receiver.set_winner = true
        @server.wins=0
        @server.value="0"
          return
        end

        if(@server.value == "45" && @receiver.value == "40")
         @receiver.value = "40"
         @server.value = "40"
          return
        end

       if(@server.value == "40" && @receiver.value == "40")
         @receiver.value = "45"
         @server.value = "40"
         return
        end

    end


  end #konec receiver scoring

end

class Server

attr_accessor :value, :wins, :set_winner

    def initialize
      @value = "0"
      @wins = 0
      @set_winner = false
    end

end

class Receiver
  attr_accessor :value, :wins, :set_winner
      def initialize
      @value = "0"
      @wins = 0
      @set_winner = false
    end
end