def count_xmas_p1(grid)
  # Dimensions of the grid
  rows = grid.size
  cols = grid[0].size
  sequence = "XMAS"
  directions = [
    [0, 1], # Right (horizontal)
    [1, 0], # Down (vertical)
    [1, 1], # Diagonal down-right
    [1, -1], # Diagonal down-left
    [0, -1], # Left (horizontal backwards)
    [-1, 0], # Up (vertical backwards)
    [-1, -1], # Diagonal up-left
    [-1, 1] # Diagonal up-right
  ]

  count = 0

  rows.times do |row|
    cols.times do |col|
      directions.each do |dx, dy|
        found = true

        sequence.size.times do |i|
          x, y = row + i * dx, col + i * dy
          if x < 0 || x >= rows || y < 0 || y >= cols || grid[x][y] != sequence[i]
            found = false
            break
          end
        end

        count += 1 if found
      end
    end
  end

  count
end

def count_xmas_p2(grid)
  # Dimensions of the grid
  rows = grid.size
  cols = grid[0].size
  sequence = "MAS"
  directions = [
    # [0, 1],   # Right (horizontal)
    # [1, 0],   # Down (vertical)
    [1, 1], # Diagonal down-right
    [1, -1], # Diagonal down-left
    # [0, -1],  # Left (horizontal backwards)
    # [-1, 0],  # Up (vertical backwards)
    [-1, -1], # Diagonal up-left
    [-1, 1] # Diagonal up-right
  ]

  count = 0

  rows.times do |row|
    cols.times do |col|
      fc = 0
      directions.each do |dx, dy|
        found = true

        puts "row = #{row} col = #{col} grid[row][col] = #{grid[row][col]} dx = #{dx} dy = #{dy}"
        [-1, 0, 1].each_with_index do |e, i|
          x, y = row + e * dx, col + e * dy
          if x < 0 || x >= rows || y < 0 || y >= cols || grid[x][y] != sequence[i]
            if row == 1 && col == 1
              puts "x = #{x} y = #{y} grid[x][y] = #{grid[x][y]} e = #{e}"
            end
            found = false
            break
          end
        end

        fc += 1 if found
        if row == 1 && col == 1
          puts "row = #{row} col = #{col} dx = #{dx} dy = #{dy} fc = #{fc}"
        end
      end
      if fc > 1
        count += 1
      end
    end
  end

  count
end

grid = []
while (line = gets)
  grid << line.chomp
end
puts "#{count_xmas_p2(grid)}"
