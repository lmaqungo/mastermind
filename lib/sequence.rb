class Sequence
  attr_reader :code
  @@colors = %w(red green blue yellow magenta cyan)
  
  def initialize(length=4)
    @code = []
    length.times do |i|
      code[i] = @@colors.sample
    end
  end

  def self.colors
    return @@colors
  end
  
end