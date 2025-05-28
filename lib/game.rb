require_relative 'display'
require_relative 'sequence'
require_relative 'ai'
require_relative 'human'
require 'colorize'

class Game
  attr_reader :rounds, :display, :human, :ai

  def initialize(rounds=8)
    @rounds = rounds
    @display = Display.new
    @ai = AI.new
    @human = Human.new
    puts "Welcome to Mastermind: "
  end

  def get_pegs(input_sequence, objective_sequence)
    red_peg_counter = 0
    white_peg_counter = 0
    remaining_input_colors = []
    remaining_objective_sequence = []
    4.times do |i|
      if objective_sequence[i] == input_sequence[i]
        red_peg_counter+=1
      else
        remaining_input_colors << input_sequence[i]
        remaining_objective_sequence << objective_sequence[i]
      end
    end
    remaining_input_colors.each do |color|
      if remaining_objective_sequence.uniq.include?(color)
        white_peg_counter+=1
      end
    end
    return [white_peg_counter, red_peg_counter]
  end

  def check_equality(input_sequence, objective_sequence)
    input_sequence == objective_sequence
  end

  def select_mode
    print "Select mode code-#{"\'breaker\'".colorize(:red)} or code-#{"\'maker\'".colorize(:blue)}: "
    mode_input = gets.chomp
    case mode_input
    when 'breaker'
      return :code_breaker
    when 'maker'
      return :code_maker
    end
  end

end
