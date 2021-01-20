# frozen_string_literal: true

require 'spec_helper'
require 'editor'

RSpec.describe Editor do
  subject(:editor) { described_class.new }

  describe '#run' do
    it 'can output empty state' do
      expect { editor.run('examples/show.txt') }.to output("There is no image\n").to_stdout
    end

    it 'can output grid' do
      expect { editor.run('examples/create.txt') }.to output("OOOO\nOOOO\nOOOO\n").to_stdout
    end

    it 'can handle more complex inputs' do
      expect { editor.run('examples/create_complex.txt') }.to output("OOOOO\nOOZZZ\nAWOOO\nOWOOO\nOWOOO\nOWOOO\n").to_stdout
    end
  end
end
