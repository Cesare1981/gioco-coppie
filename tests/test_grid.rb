require_relative '../lib/grid'
require 'test/unit'

class TestGrid < Test::Unit::TestCase
  def test_create_grid
    lvl = Level.new
    lvl.create
    return true if lvl.grid
    false
  end

  def test_number_of_tiles
    lvl = Level.new
    lvl.grid = Grid.new( { rows: 5, columns: 5, dots: {} } )
    assert_equal(25, lvl.grid.tiles.size)
  end

  def test_out_of_grid
    lvl = Level.new
    tiles = lvl.create
    event = Ruby2D::Window::MouseEvent.new
    event.x = lvl.grid.x - 10
    event.y = lvl.grid.y - 10
    assert lvl.grid.out_of_grid(event)
  end
end