# frozen_string_literal: true

# class to process the user input
class InputProcessor
  COMMAND_REQUIRES_X_AND_Y = %w[I L V H].freeze
  VALID_COMMANDS = %w[I C L V H S].freeze

  # class for out of bounds error
  class OutOfBoundsError < StandardError; end

  # class for invalid command error
  class InvalidCommandError < StandardError; end

  attr_reader :command, :x, :y, :colour

  def initialize(line)
    @line = line
    line_parser
    validate_command!
    validate_x_and_y!
  end

  private

  def line_parser
    @command, *args = @line.split
    @y = args.fetch(0, nil)&.to_i
    @x = args.fetch(1, nil)&.to_i
    @colour = args.fetch(2, nil)
  end

  def validate_x_and_y!
    return unless COMMAND_REQUIRES_X_AND_Y.include?(@command)

    validate_presence_of_x_and_y!
    { x: @x, y: @y }.each do |key, value|
      message = out_of_bounds_message(key.to_s, value)
      raise OutOfBoundsError.new(message) if value > 250 || value < 1
    end
  end

  def validate_presence_of_x_and_y!
    { x: @x, y: @y }.each do |key, _value|
      message = out_of_bounds_message(key.to_s, 0)
      raise OutOfBoundsError.new(message) unless @x.is_a?(Integer)
    end
  end

  def validate_command!
    raise InvalidCommandError.new(
      "Command #{@command} must be one of #{VALID_COMMANDS}"
    ) unless VALID_COMMANDS.include?(@command)
  end

  def out_of_bounds_message(axes, value)
    "The #{axes} value #{value} is out of range, it should be between 1 and 252"
  end
end
