# frozen_string_literal: true

require 'spec_helper'
require 'input_processor'

RSpec.describe InputProcessor do

  describe '#new' do
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

      describe 'when there is only a command' do
        it 'can capture the command' do
          expect(described_class.new('S').command).to eq 'S'
        end
      end
    end
  end
end
