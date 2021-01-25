# frozen_string_literal: true

# class to process the user input
class InputProcessor
  LINE_REGEX = /(?<command>\w)\s?(?<m>\d+)?\s?(?<n>\d+)?\s?(?<colour>\w)?/.freeze
  COMMAND_REQUIRES_X_AND_Y = %w[I L V H].freeze
  VALID_COMMANDS = %w[I C L V H S].freeze

  # class for out of bounds error
  class OutOfBoundsError < StandardError
    def initialize(axes, value)
      @axes = axes
      @value = value
    end

    def message
      "The #{@axes} value #{@value} is out of range, it should be between 1 and 252"
    end
  end

  # class for invalid command error
  class InvalidCommandError < StandardError
    def initialize(command)
      @command = command
    end

    def message
      "Command #{@command} must be one of #{InputProcessor::VALID_COMMANDS}"
    end
  end

  attr_reader :command, :x, :y, :colour

  def initialize(line)
    @line = line
    line_parser
    validate_command!
    validate_x_and_y!
  end

  private

  def line_parser
    match = @line.match(LINE_REGEX)
    @command = match[:command]
    @y = match[:m]&.to_i
    @x = match[:n]&.to_i
    @colour = match[:colour]
  end

  def validate_x_and_y!
      return unless COMMAND_REQUIRES_X_AND_Y.include?(@command)

      validate_presence_of_x_and_y!
      raise OutOfBoundsError.new('x', @x) if @x > 250 || @x < 1
      raise OutOfBoundsError.new('y', @y) if @y > 250 || @y < 1
  end

  def validate_presence_of_x_and_y!
    { x: @x, y: @y }.each do |key, _value|
      raise OutOfBoundsError.new(key.to_s, 0) unless @x.is_a?(Integer)
    end
  end

  def validate_command!
    raise InvalidCommandError.new(@command) unless VALID_COMMANDS.include?(@command)
  end
end
