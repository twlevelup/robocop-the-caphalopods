class Map

  def initialize (cbd_grid_height, cbd_grid_width)
    @map = []
    cbd_grid_height.times do
      row = Array.new(cbd_grid_width, '.')
      @map << row
    end
  end

  def add_robot (position, emoji)
    row = @map[position[:y]]
    row[position[:x]] = emoji
  end

  def to_s
    map_s = ""
    @map.each do | row |
      row_s = row.join("  ")
      map_s = row_s + "\n" + map_s
    end
    map_s
  end
end