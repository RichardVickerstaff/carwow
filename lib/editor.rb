# frozen_string_literal: true

# This is the entrypoint of this application
class Editor
  def run(file)
    return puts 'please provide correct file' if file.nil? || !File.exist?(file)

    image = nil

    File.open(file).each do |line|
      begin
        input = InputProcessor.new(line)

        case input.command
        when 'S'
          if image.nil?
            puts 'There is no image'
          else
            puts image.print
          end
        when 'I'
          image = Grid.new(input.x, input.y)
        when 'L'
          image.colour_pixel(input.x, input.y, input.colour)
        when 'V'
          image.vertical_segment(
            segment_position: input.segment_position,
            segment_range: input.segment_range,
            colour: input.colour
          )
        when 'H'
          image.horizontal_segment(
            segment_position: input.segment_position,
            segment_range: input.segment_range,
            colour: input.colour
          )
        when 'C'
          image.clear
        end
      rescue InputProcessor::OutOfBoundsError, InputProcessor::InvalidCommandError => e
        puts e.message
        break
      end
    end
  end
end
