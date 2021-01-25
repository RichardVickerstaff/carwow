# frozen_string_literal: true

require 'spec_helper'
require 'grid'

RSpec.describe Grid do
  subject(:editor) { described_class.new }

  describe '#print' do
    it 'can create a 1x1 grid' do
      expect(described_class.new(1, 1).print).to eq ['O']
    end

    it 'can create a 2x2 grid' do
      expect(described_class.new(2, 2).print).to eq %w[OO OO]
    end
  end

  describe '#colour_pixel' do
    it 'can colour a pixel with a given colour' do
      grid = described_class.new(2, 3)
      grid.colour_pixel(2, 3, 'W')
      expect(grid.print).to eq %w[OOO OOW]
    end
  end

  describe '#clear' do
    it 'resets the grid back to all O' do
      grid = described_class.new(2, 3)
      grid.colour_pixel(2, 3, 'W')
      expect { grid.clear }.to change { grid.print }.from(%w[OOO OOW]).to(%w[OOO OOO])
    end
  end

  describe '#vertical_segment' do
    it 'resets the grid back to all O' do
      grid = described_class.new(3, 3)
      expect { grid.vertical_segment(segment_position: 2, segment_range: 1..2, colour: 'Z') }.to change { grid.print }.from(%w[OOO OOO OOO]).to(%w[OZO OZO OOO])
    end
  end

  describe '#horizontal_segment' do
    it 'resets the grid back to all O' do
      grid = described_class.new(3, 3)
      expect { grid.horizontal_segment(segment_position: 2, segment_range: 1..2, colour: 'Z') }.to change { grid.print }.from(%w[OOO OOO OOO]).to(%w[OOO ZZO OOO])
    end
  end
end
