require "byebug"

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq, :user_guesses, :difficulty

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @user_guesses = []
    @difficulty = 3
  end

  def play
    puts "Hello there! Welcome to Simon"
    puts "Choose difficulty (1 - 3): "
    self.difficulty = Integer(gets.chomp)
    while !self.game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if !self.game_over
      self.round_success_message 
      self.sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    p self.seq
    sleep(self.difficulty)
    system("clear")
  end

  def require_sequence
    self.user_guesses = []
    puts "What was the sequence?"
    self.sequence_length.times do 
      input = gets.chomp
      self.user_guesses << input
    end
    if self.seq != user_guesses
      self.game_over = true
    end
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "Success! Keep going."
  end

  def game_over_message
   puts "Game Over"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
    self.user_guesses = []
  end
end

if $PROGRAM_NAME == __FILE__
  simon = Simon.new
  simon.play
end