require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14)
    self.place_stones
  end

  def place_stones # helper method to #initialize every non-store cup with four stones each
    (0..5).each { |i| self.cups[i] = [:stone, :stone, :stone, :stone] }
    (7..12).each { |i| self.cups[i] = [:stone, :stone, :stone, :stone] }
    self.cups[6] = []
    self.cups[13] = []
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13
      raise "Invalid starting cup"
    elsif self.cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    ending_cup_idx = 0
    i = (start_pos + 1) % 14
    self.cups[start_pos].each do |stone|
      if current_player_name == @name1 && i == 13
        i = (i + 1) % 14
        self.cups[i] << stone
      elsif current_player_name == @name2 && i == 6
        i = (i + 1) % 14
        self.cups[i] << stone
      else
        self.cups[i] << stone
      end
      ending_cup_idx = i
      i = (i + 1) % 14 
    end
    self.cups[start_pos] = []
    self.render
    self.next_turn(ending_cup_idx, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name) # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    ended_points_cup = (current_player_name == @name1 && ending_cup_idx == 6) || (current_player_name == @name2 && ending_cup_idx == 13)
    ended_empty_cup = self.cups[ending_cup_idx].length == 1 
    ended_stone_cup = self.cups[ending_cup_idx].length > 1

    case
    when ended_points_cup
      return :prompt
    when ended_empty_cup
      return :switch
    when ended_stone_cup
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    self.cups[0..5].all? { |cup| cup.empty? } || self.cups[6..12].all? { |cup| cup.empty? }
  end

  def winner
    if self.cups[6] == self.cups[13]
      return :draw
    elsif self.cups[6].length > self.cups[13].length
      return @name1
    else
      return @name2
    end
  end
end
