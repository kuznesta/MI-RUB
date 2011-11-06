class Roman
MAX_ROMAN = 4999

  def initialize(value)
      if value < 0 || value > MAX_ROMAN
          fail "Roman values must be > 0 and <= #{MAX_ROMAN}"
      end
      @value = value
  end

  FACTORS = [["M", 1000],["XM",990], ["CM", 900], ["D", 500],["XD",490], ["CD", 400],
              ["C", 100], ["XC", 90], ["L", 50], ["XL", 40],
              ["X", 10], ["IX", 9], ["V", 5], ["IV", 4],
              ["I", 1]]

def to_s

  vysledek = ""
  value = @value

  while(value > 0)

      for code, factor in FACTORS
        if((value-factor) >= 0)
          value -= factor
          vysledek += code
           break
        end
      end

  end
   return vysledek
end

end