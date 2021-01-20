# frozen_string_literal: true

class Grid
  def initialize(n_pixels, m_pixels)
    @grid = create_grid(n_pixels, m_pixels)
  end

  def print
    @grid.map(&:join)
  end

  def colour_pixel(x_value, y_value, colour)
    @grid[x_value - 1][y_value - 1] = colour
  end

  private def create_grid(n_pixels, m_pixels)
    Array.new(n_pixels) do
      Array.new(m_pixels) { 'O' }
    end
  end
end
