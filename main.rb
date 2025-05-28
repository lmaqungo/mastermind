require_relative "lib/game"

def play(game_obj)
    mode = game_obj.select_mode
    case mode
    when :code_breaker
      objective_sequence = Sequence.new.code
      game_obj.human.play(game_obj, objective_sequence)
    when :code_maker 
      print "Create a sequence for the computer to guess: "
      objective_sequence = gets.chomp.split
      game_obj.ai.play(game_obj, objective_sequence)
    end
end

test_game = Game.new
play(test_game)