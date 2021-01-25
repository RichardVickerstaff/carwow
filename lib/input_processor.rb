# frozen_string_literal: true

# class to process the user input
class InputProcessor
  LINE_REGEX = /(?<command>\w)\s?(?<m>\d+)?\s?(?<n>\d+)?\s?(?<colour>\w)?/.freeze

  # class to process the user input
  class OutOfBoundsError < StandardError
    def initialize(axes, value)
      @axes = axes
      @value = value
    end

    def message
      "The #{@axes} value #{@value} is out of range, it should be between 1 and 252"
    end
  end

  attr_reader :command, :x, :y, :colour

  def initialize(line)
    @line = line
    line_parser
    validate_x_and_y!
  end

  private def line_parser
    match = @line.match(LINE_REGEX)
    @command = match[:command]
    @y = match[:m]&.to_i
    @x = match[:n]&.to_i
    @colour = match[:colour]
  end

  private def validate_x_and_y!
    if @x && @y
      raise OutOfBoundsError.new('x', @x) if @x > 250 || @x < 1
      raise OutOfBoundsError.new('y', @y) if @y > 250 || @y < 1
    end
  end
end
