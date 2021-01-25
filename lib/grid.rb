# frozen_string_literal: true

class Grid
  def initialize(n_pixels, m_pixels)
    @n_pixels = n_pixels
    @m_pixels = m_pixels
    @grid = create_grid
  end

  def print
    @grid.map(&:join)
  end

  def colour_pixel(x_value, y_value, colour)
    @grid[x_value - 1][y_value - 1] = colour
  end

  def clear
    @grid = create_grid
  end

  def vertical_segment(segment_position:, segment_start:, segment_end:, colour:)
    x_range = (segment_start..segment_end).to_a
    y = segment_position
    x_range.each { |x| colour_pixel(x, y, colour)}
  end

  private def create_grid
    Array.new(@n_pixels) do
      Array.new(@m_pixels) { 'O' }
    end
  end
end
