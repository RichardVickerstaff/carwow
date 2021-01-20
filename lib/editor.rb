# frozen_string_literal: true

LINE_REGEX = %r/(?<command>\w) (?<m>\d)? (?<n>\d)?.*/

# This is the entrypoint of this application
class Editor
  def run(file)
    return puts 'please provide correct file' if file.nil? || !File.exist?(file)

    image = nil

    File.open(file).each do |line|
      case line[0]
      when 'S'
        if image.nil?
          puts 'There is no image'
        else
          puts image
        end
      when 'I'
        parsed_line = line_parser(line)
        # image = create_grid(parsed_line[:n], parsed_line[:m])
        image = "OOOO\nOOOO\nOOOO\n"
      when 'L'
        # TODO
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

  def create_grid(n_pixels, m_pixels)
    Array.new(n_pixels) do
      Array.new(m_pixels) { 'O' }
    end
  end

  def line_parser(line)
    match = line.match(LINE_REGEX)
    { command: match[:command], m: match[:m]&.to_i, n: match[:n]&.to_i }
  end

end
