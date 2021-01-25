# frozen_string_literal: true

require 'spec_helper'
require 'input_processor'

RSpec.describe InputProcessor do

  describe '#new' do
    context 'with an invalid command' do
      it 'raises an error when an x value is too large' do
        expect { described_class.new('I 300 6') }.to  raise_error(InputProcessor::OutOfBoundsError)
      end

      it 'raises an error when an x value is too small' do
        expect { described_class.new('I 0 6') }.to  raise_error(InputProcessor::OutOfBoundsError)
      end

      it 'raises an error when an y value is too large' do
        expect { described_class.new('I 5 300') }.to  raise_error(InputProcessor::OutOfBoundsError)
      end

      it 'raises an error when an y value is too small' do
        expect { described_class.new('I 5 0') }.to  raise_error(InputProcessor::OutOfBoundsError)
      end

      it 'raises an error when there is an invalid command' do
        expect { described_class.new('P 5 0') }.to  raise_error(InputProcessor::InvalidCommandError)
      end

      it 'raises an error if there is no y for a command that needs it' do
        expect { described_class.new('V 5') }.to  raise_error(InputProcessor::OutOfBoundsError)
      end

      it 'raises an error if there is no x for a command that needs it' do
        expect { described_class.new('V') }.to  raise_error(InputProcessor::OutOfBoundsError)
      end
    end

    context 'with a valid command' do
      it 'can capture the command' do
        expect(described_class.new('I 5 6').command).to eq 'I'
      end

      it 'can capture the y' do
        expect(described_class.new('I 5 6').y).to eq 5
      end

      it 'can capture the x' do
        expect(described_class.new('I 5 6').x).to eq 6
      end

      it 'can capture the values when they are more than one digit' do
        input = described_class.new('I 110 120')
        expect(input.x).to eq 120
        expect(input.y).to eq 110
      end

      describe 'when there is only a command' do
        it 'can capture the command' do
          expect(described_class.new('S').command).to eq 'S'
        end
      end
    end
  end
end
