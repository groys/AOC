$stdout.sync = true
grid = []
si = 0
sj = 0
i = 0

Point = Struct.new(:i, :j, :c, :dir)
while line = gets
  grid << line
  j = line.index ('S')
  if !j.nil?
    sj = j
    si = i
  end
  i += 1
  # identify loop i.e. sequence of points. Leverage that there is only one loop
  # how many total points in the loop. Divide by 2 for answer
  # brute force keep adding sequences
  # detect if multiple points work. But
  #
  # For S out of 4 2 points should be legit. Pick 1. Find next legit point
end
loop = []
S = Point.new(si, sj, 'S')
loop << S
currP = nil
# check west
if S.j - 1 >= 0 && (grid[S.i][S.j - 1] == '-' || grid[S.i][S.j - 1] == 'F' || grid[S.i][S.j - 1] == 'L')
  nextC = grid[S.i][S.j - 1]
  nextD = nil
  case nextC
  when '-'
    nextD = 'W'
  when 'F'
    nextD = 'S'
  when 'L'
    nextD = 'N'
  end
  currP = Point.new(S.i, S.j - 1, nextC, nextD)
  # check east
elsif S.j + 1 < grid[0].length && (grid[S.i][S.j + 1] == '-' || grid[S.i][S.j + 1] == 'J' || grid[S.i][S.j + 1] == '7')
  nextC = grid[S.i][S.j + 1]
  nextD = nil
  case nextC
  when '-'
    nextD = 'E'
  when 'J'
    nextD = 'N'
  when '7'
    nextD = 'S'
  end
  currP = Point.new(S.i, S.j + 1, nextC, nextD)
  # check north
elsif S.i - 1 >= 0 && (grid[S.i - 1][S.j] == '|' || grid[S.i - 1][S.j] == 'F' || grid[S.i - 1][S.j] == '7')
  nextC = grid[S.i - 1][S.j]
  nextD = nil
  case nextC
  when '|'
    nextD = 'N'
  when 'F'
    nextD = 'E'
  when '7'
    nextD = 'W'
  end
  currP = Point.new(S.i - 1, S.j, nextC, nextD)
  #check south
elsif S.i + 1 < grid[0].length && (grid[S.i + 1][S.j] == '|' || grid[S.i + 1][S.j] == 'L' || grid[S.i - 1][S.j] == 'J')
  nextC = grid[S.i + 1][S.j]
  nextD = nil
  case nextC
  when '|'
    nextD = 'S'
  when 'J'
    nextD = 'W'
  when 'L'
    nextD = 'E'
  end
  currP = Point.new(S.i + 1, S.j, nextC, nextD)
end
loop << currP
while true
  # puts "loop = #{loop}"
  # sleep 10
  case currP.c
  when 'S'
    break
  when '|'
    if currP.dir == 'N'
      nextC = grid[currP.i - 1][currP.j]
      nextD = nil
      case nextC
      when '|'
        nextD = 'N'
      when 'F'
        nextD = 'E'
      when '7'
        nextD = 'W'
      end
      currP = Point.new(currP.i - 1, currP.j, nextC, nextD)
    else
      nextC = grid[currP.i + 1][currP.j]
      nextD = nil
      case nextC
      when '|'
        nextD = 'S'
      when 'L'
        nextD = 'E'
      when 'J'
        nextD = 'W'
      end
      currP = Point.new(currP.i + 1, currP.j, nextC, nextD)
    end
  when '-'
    if currP.dir == 'E'
      nextC = grid[currP.i][currP.j + 1]
      nextD = nil
      case nextC
      when '-'
        nextD = 'E'
      when '7'
        nextD = 'S'
      when 'J'
        nextD = 'N'
      end
      currP = Point.new(currP.i, currP.j + 1, nextC, nextD)
    else
      nextC = grid[currP.i][currP.j - 1]
      nextD = nil
      case nextC
      when '-'
        nextD = 'W'
      when 'L'
        nextD = 'N'
      when 'F'
        nextD = 'S'
      end
      currP = Point.new(currP.i, currP.j - 1, nextC, nextD)
    end
  when 'L'
    if currP.dir == 'N'
      nextC = grid[currP.i - 1][currP.j]
      nextD = nil
      case nextC
      when '|'
        nextD = 'N'
      when 'F'
        nextD = 'E'
      when '7'
        nextD = 'W'
      end
      currP = Point.new(currP.i - 1, currP.j, nextC, nextD)
      # dir = E
    else
      nextC = grid[currP.i][currP.j + 1]
      nextD = nil
      case nextC
      when '-'
        nextD = 'E'
      when '7'
        nextD = 'S'
      when 'J'
        nextD = 'N'
      end
      currP = Point.new(currP.i, currP.j + 1, nextC, nextD)
    end
  when 'J'
    if currP.dir == 'N'
      nextC = grid[currP.i - 1][currP.j]
      nextD = nil
      case nextC
      when '|'
        nextD = 'N'
      when 'F'
        nextD = 'E'
      when '7'
        nextD = 'W'
      end
      currP = Point.new(currP.i - 1, currP.j, nextC, nextD)
      # dir = W
    else
      nextC = grid[currP.i][currP.j - 1]
      nextD = nil
      case nextC
      when '-'
        nextD = 'W'
      when 'F'
        nextD = 'S'
      when 'L'
        nextD = 'N'
      end
      currP = Point.new(currP.i, currP.j - 1, nextC, nextD)
    end
  when 'F'
    if currP.dir == 'E'
      nextC = grid[currP.i][currP.j + 1]
      nextD = nil
      case nextC
      when '-'
        nextD = 'E'
      when 'J'
        nextD = 'N'
      when '7'
        nextD = 'S'
      end
      currP = Point.new(currP.i, currP.j + 1, nextC, nextD)
      # dir = S
    else
      nextC = grid[currP.i + 1][currP.j]
      nextD = nil
      case nextC
      when '|'
        nextD = 'S'
      when 'J'
        nextD = 'W'
      when 'L'
        nextD = 'E'
      end
      currP = Point.new(currP.i + 1, currP.j, nextC, nextD)
    end
  when '7'
    if currP.dir == 'W'
      nextC = grid[currP.i][currP.j - 1]
      nextD = nil
      case nextC
      when '-'
        nextD = 'W'
      when 'L'
        nextD = 'N'
      when 'F'
        nextD = 'S'
      end
      currP = Point.new(currP.i, currP.j - 1, nextC, nextD)
      # dir = S
    else
      nextC = grid[currP.i + 1][currP.j]
      nextD = nil
      case nextC
      when '|'
        nextD = 'S'
      when 'J'
        nextD = 'W'
      when 'L'
        nextD = 'E'
      end
      currP = Point.new(currP.i + 1, currP.j, nextC, nextD)
    end
  end
  loop << currP
end
puts "part1 #{loop.length / 2}"
