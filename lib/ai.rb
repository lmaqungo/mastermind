require_relative 'sequence'
require_relative 'display'


class AI

  def initialize
    @display = Display.new
  end

  def get_possible_codes
    codes = []
    [1, 2, 3, 4, 5, 6].repeated_permutation(4) {|permutation| codes.push(permutation)}
    return codes
  end

  def color_converter(input_sequence, mode)
    color_to_index = {}
    Sequence.colors.each_with_index do |color, index|
      color_to_index[color] = index+1
    end
    case mode
    when :to_color 
      input_sequence.map {|num| Sequence.colors[num-1]}
    when :to_num 
      input_sequence.map {|color| color_to_index[color] }
    end
  end

  def guess(game_obj, computer_num_sequence, remaining_codes, objective_sequence)
    color_sequence = color_converter(computer_num_sequence, :to_color)
    response = game_obj.get_pegs(color_sequence, objective_sequence)
    partition = remaining_codes.select do |code|
      color_arr = color_converter(code, :to_color)
      color_response = game_obj.get_pegs(color_sequence, color_arr)
      color_response == response
    end
    @display.ui(response, color_sequence.join(" "))
    return partition
  end

  def play(game_obj, objective_sequence)
    first_guess = [1 ,1, 2, 2]
    remaining_codes = get_possible_codes
    next_guess = first_guess
    game_obj.rounds.times do |round|
      win_game = game_obj.check_equality(color_converter(next_guess, :to_color), objective_sequence)
      if win_game
        puts "Code has been found in #{round+1} rounds: #{@display.colored_markers(color_converter(next_guess, :to_color))}"
        break
      else
        remaining_codes = guess(game_obj, next_guess, remaining_codes, objective_sequence)
        next_guess = remaining_codes.first
      end
    end
  end

end



