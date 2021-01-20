# frozen_string_literal: true

LINE_REGEX = %r/(?<command>\w)\s?(?<m>\d)?\s?(?<n>\d)?\s?(?<colour>\w)?/

# This is the entrypoint of this application
class Editor
  def run(file)
    return puts 'please provide correct file' if file.nil? || !File.exist?(file)

    image = nil

    File.open(file).each do |line|
      parsed_line = line_parser(line)
      case line[0]
      when 'S'
        if image.nil?
          puts 'There is no image'
        else
          puts image.print
        end
      when 'I'
        image = Grid.new(parsed_line[:n], parsed_line[:m])
      when 'L'
        image.colour_pixel(parsed_line[:n], parsed_line[:m], parsed_line[:colour])
      when 'V'
        # TODO
      when 'H'
        # TODO
      when 'C'
        # TODO
      else
        puts 'unrecognised command :('
      end
    end
  end

  def line_parser(line)
    match = line.match(LINE_REGEX)
    { command: match[:command], m: match[:m]&.to_i, n: match[:n]&.to_i, colour: match[:colour]}
  end

end
