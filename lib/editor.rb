# frozen_string_literal: true

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
        # TODO: - Currently hardcoded for `I 4 3`
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
end
