# expand
# all pairs shortest path
# |x1 - x2| + |y1-y2| + 1
$stdout.sync = true
# mult = 2 for part 1
mult = 1000000

grid = []
while line = gets
  chars = line.strip.chomp.chars
  if !chars.include?('#')
    grid << Array.new(chars.length, 'x')
  else
    grid << chars
  end
end
grid = grid.transpose
newgrid = []
for arr in grid
  if !arr.include?('#')
    newgrid << Array.new(arr.length, 'x')
  else
    newgrid << arr
  end
end
grid = newgrid.transpose
grid.each { |x| puts x.join
}
# array of points
p = []
for i in 0...grid.length
  for j in 0...grid[i].length
    if grid[i][j] == '#'
      p << [i, j]
    end
  end
end
# puts "#{p}"
d = 0

for i in 0...p.length
  for j in (i + 1)...p.length
    d1 = 0
    d1 += (p[i][0] - p[j][0]).abs
    # count number of x
    mi, ma = [p[i][0], p[j][0]].minmax
    c1 = grid[mi...ma].count { |row| row[0] == 'x' }
    d1 += c1 * (mult - 1)
    
    d1 += (p[i][1] - p[j][1]).abs
    # count number of x
    mi, ma = [p[i][1], p[j][1]].minmax

    c2 = grid[0][mi...ma].count { |c| c == 'x' }
    d1 += c2 * (mult - 1)
    d += d1
    # puts "i #{i} j #{j} c1 #{c1} c2 #{c2} d1 #{d1}"
  end
end
puts "part2 #{d}"
