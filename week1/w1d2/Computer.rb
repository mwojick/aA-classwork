class ComputerPlayer

  def initialize
    @known_cards = Hash.new { |hash, key| hash[key] = [] }
  end

  def guess
    #if match?
      #if @previous_guess == @known_cards[]
        #return the second position
      #else
        #return first position
    #else

      #return receive_match
    rand1,rand2 = [(0...@grid.size).to_a.sample,(0...@grid.size).to_a.sample]
  end

  def receive_revealed_card(num,guess)
    @known_cards[num] << guess
  end

  def receive_match(num) #return pos
    @known_cards.delete(num)
  end




  def match? #boolean for a match
    @known_cards.values.each do |arr|
      return true if arr.flatten.length == 4
    end
    false
  end

end
