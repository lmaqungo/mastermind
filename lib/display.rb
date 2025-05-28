require 'colorize'

class Display
  
  def ui(pegs_arr, input_guess)
    # pegs = "#{"O" * pegs_arr[0]}#{"O".colorize(:black) * pegs_arr[1]}"
    pegs = pegs_arr
    display = "#{colored_markers(input_guess)}\npegs: #{pegs}"
    puts display
  end

  def colored_markers(input_guess)
    markers = ''
    input_type = input_guess.class.name
    case input_type
    when "String"
      input_guess.split(" ").each {|marker| markers.concat("#{"O".colorize(marker.to_sym)} ")}
    when "Array"
      input_guess.each {|marker| markers.concat("#{"O".colorize(marker.to_sym)} ")}
    end
    return markers
  end
  
end

