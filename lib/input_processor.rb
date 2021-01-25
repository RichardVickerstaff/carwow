# frozen_string_literal: true

# class to process the user input
class InputProcessor
  LINE_REGEX = /(?<command>\w)\s?(?<m>\d)?\s?(?<n>\d)?\s?(?<colour>\w)?/.freeze

  attr_reader :command, :x, :y, :colour

  def initialize(line)
    @line = line
    line_parser
  end

  def line_parser
    match = @line.match(LINE_REGEX)
    @command = match[:command]
    @y = match[:m]&.to_i
    @x = match[:n]&.to_i
    @colour = match[:colour]
  end
end
