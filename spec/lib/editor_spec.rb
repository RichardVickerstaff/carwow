# frozen_string_literal: true

require 'spec_helper'
require 'editor'

RSpec.describe Editor do
  subject(:editor) { described_class.new }

  describe '#run' do
    context 'with an invalid input' do
      context 'invalid x or y' do
        it 'informs the user of the error' do
          expect { editor.run('examples/invalid.txt') }.to output("The y value 300 is out of range, it should be between 1 and 252\n").to_stdout
        end
      end

      context 'invalid command' do
        it 'informs the user of the error' do
          expect { editor.run('examples/invalid_command.txt') }.to output("Command P must be one of [\"I\", \"C\", \"L\", \"V\", \"H\", \"S\"]\n").to_stdout
        end
      end
    end

    context 'with a valid input' do
      it 'can output empty state' do
        expect { editor.run('examples/show.txt') }.to output("There is no image\n").to_stdout
      end

      it 'can output grid' do
        expect { editor.run('examples/create.txt') }.to output("OOOO\nOOOO\nOOOO\n").to_stdout
      end

      it 'can output a 1 x 1 grid' do
        expect { editor.run('examples/create_1x1.txt') }.to output("O\n").to_stdout
      end

      it 'can handle more complex inputs' do
        expect do
          editor.run('examples/create_complex.txt')
        end.to output("OOOOO\nOOZZZ\nAWOOO\nOWOOO\nOWOOO\nOWOOO\n").to_stdout
      end

      describe 'can colour the pixels (X,Y) with a colour' do
        it 'can colour the pixles with W' do
          expect { editor.run('examples/colour_with_w.txt') }.to output("OWOO\nOOOO\nOOOO\n").to_stdout
        end
      end

      describe 'can clear any changes' do
        it 'clears coloured pixels' do
          expect { editor.run('examples/clear.txt') }.to output("OOOO\nOOOO\nOOOO\n").to_stdout
        end
      end
    end
  end
end
