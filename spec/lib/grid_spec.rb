# frozen_string_literal: true

require 'spec_helper'
require 'grid'

RSpec.describe Grid do
  subject(:editor) { described_class.new }

  describe '#print' do
    it 'can create a 1x1 grid' do
      expect(described_class.new(1,1).print).to eq ['O']
    end

    it 'can create a 2x2 grid' do
      expect(described_class.new(2,2).print).to eq %w[OO OO]
    end
  end

  describe '#colour_pixel' do
    it 'can colour a pixel with a given colour' do
      grid = described_class.new(2,3)
      grid.colour_pixel(2, 3, 'W')
      expect(grid.print).to eq %w[OOO OOW]
    end
  end
end