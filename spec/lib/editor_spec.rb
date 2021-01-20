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

    it "can output a 1 x 1 grid" do
      expect { editor.run('examples/create_1x1.txt') }.to output("O\n").to_stdout
    end

    it 'can handle more complex inputs' do
      expect { editor.run('examples/create_complex.txt') }.to output("OOOOO\nOOZZZ\nAWOOO\nOWOOO\nOWOOO\nOWOOO\n").to_stdout
    end
  end

  describe '#line_parser' do
    it 'can capture the command' do
      expect(editor.line_parser('I 5 6')[:command]).to eq 'I'
    end

    it 'can capture the m' do
      expect(editor.line_parser('I 5 6')[:m]).to eq 5
    end

    it 'can capture the n' do
      expect(editor.line_parser('I 5 6')[:n]).to eq 6
    end

    describe 'when there is only a command' do
      it 'can capture the command' do
        expect(editor.line_parser('S')[:command]).to eq 'S'
      end
    end
  end
end
