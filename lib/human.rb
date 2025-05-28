require_relative 'sequence'
require_relative 'display'

class Human 

  def initialize
    @display = Display.new
  end

  def get_input_sequence
    print "Enter a guess: "
    gets.chomp.split
  end

  def play(game_obj, objective_sequence)
    game_obj.rounds.times do |round|
      puts "Round #{round + 1}"
      guess_input = get_input_sequence
      pegs = game_obj.get_pegs(guess_input, objective_sequence)
      @display.ui(pegs, guess_input.join(" "))
      win_game = game_obj.check_equality(guess_input, objective_sequence)
      puts "correct guess? #{win_game}" 
      puts
      break if win_game
    end
  end

end