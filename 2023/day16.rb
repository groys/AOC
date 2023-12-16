require 'set'
$stdout.sync = true
Arrow = Struct.new(:i, :j, :dir)

def print_grid(enr_set)
  # puts "enr_set #{enr_set}"
  pb = []
  for i in 0...$L
    pb[i] = "." * $L
  end
  enr_set.each do |arr|
    pb[arr[0]][arr[1]] = '#'
  end
  puts "grid"
  puts pb
end

def split_horz(add, arrow, del, runs)
  # puts "split horz"

  #dir 0
  if arrow.j == $L - 1
    del << arrow
  else
    arrow.j = arrow.j + 1
    arrow.dir = 0
  end
  #dir 1
  if arrow.j == 0 || runs.include?([arrow.i, arrow.j - 1, 1])
    return
  end
  anew = Arrow.new(arrow.i, arrow.j - 1, 1)

  add << anew
end

def split_vert(add, arrow, del, runs)
  # puts "split vert"
  # dir 2
  if arrow.i == 0
    del << arrow
  else
    arrow.i -= 1
    arrow.dir = 2
  end
  # dir 3
  if arrow.i == $L - 1 || runs.include?([arrow.i + 1, arrow.j, 3])
    return
  end
  anew = Arrow.new(arrow.i + 1, arrow.j, 3)

  add << anew
end

# simulate navigation
# keep track on energized
# End conditions
# 1. Reach edge and stop moving
# 2. Reach something already visited from the same direction
# Maintain a list of arrows (i, j, dir)
# each iteration take next step. Add energizer to
# enr_hash (i, j)

#dir is 0(E), 1(W), 2(N), 3(S)
def find_energy_from_input(a, board)
  enr_set = Set.new

  #seen = Set<[int, int]>>
  seen = Set.new
  arrows = [a]

  until arrows.empty?
    del = []
    add = []
    # puts "arr size #{arrows.size}"
    arrows.each do |arrow|
      # has this run already visited?
      if seen.include?([arrow.i, arrow.j, arrow.dir])
        # puts "already visited"
        del << arrow
        next
      else
        seen.add([arrow.i, arrow.j, arrow.dir])
      end
      # add to enchanted
      enr_set.add([arrow.i, arrow.j])
      # process arrow
      char = board[arrow.i][arrow.j]
      # puts "i #{arrow.i} j #{arrow.j} dir #{arrow.dir} char #{char}"
      case char
      when '.'
        case arrow.dir
        when 0
          if arrow.j == $L - 1
            del << arrow

          else
            arrow.j = arrow.j + 1
          end
        when 1
          if arrow.j == 0
            del << arrow
          else
            arrow.j = arrow.j - 1
          end
        when 2
          if arrow.i == 0
            del << arrow
          else
            arrow.i = arrow.i - 1
          end
        when 3
          if arrow.i == $L - 1
            del << arrow
          else
            arrow.i = arrow.i + 1
          end
        else
          p "oh"
        end
      when '/'
        case arrow.dir
        when 0
          if arrow.i == 0
            del << arrow
          else
            arrow.i -= 1
            arrow.dir = 2
          end
        when 1
          if arrow.i == $L - 1
            del << arrow
          else
            arrow.i += 1
            arrow.dir = 3
          end
        when 2
          if arrow.j == $L - 1
            del << arrow
          else
            arrow.j += 1
            arrow.dir = 0
          end
        when 3
          if arrow.j == 0
            del << arrow
          else
            arrow.j -= 1
            arrow.dir = 1
          end
        else
          p "oh1"
        end
      when '\\'
        case arrow.dir
        when 0
          if arrow.i == $L - 1
            del << arrow
          else
            arrow.i += 1
            arrow.dir = 3
          end
        when 1
          if arrow.i == 0
            del << arrow
          else
            arrow.i -= 1
            arrow.dir = 2
          end
        when 2
          if arrow.j == 0
            del << arrow
          else
            arrow.j -= 1
            arrow.dir = 1
          end
        when 3
          if arrow.j == $L - 1
            del << arrow
          else
            arrow.j += 1
            arrow.dir = 0
          end
        end
      when '-'
        case arrow.dir
          # same as empty
        when 0
          if arrow.j == $L - 1
            del << arrow
          else
            arrow.j = arrow.j + 1
          end
        when 1
          if arrow.j == 0
            del << arrow
          else
            arrow.j = arrow.j - 1
          end
          # split
        when 2
          split_horz(add, arrow, del, seen)
        when 3
          split_horz(add, arrow, del, seen)
        end
      when '|'
        case arrow.dir
        when 0
          split_vert(add, arrow, del, seen)
        when 1
          split_vert(add, arrow, del, seen)
        when 2
          if arrow.i == 0
            del << arrow
          else
            arrow.i = arrow.i - 1
          end
        when 3
          if arrow.i == $L - 1
            del << arrow
          else
            arrow.i = arrow.i + 1
          end
        end
      end
    end
    # unless del.empty?
    #   puts "del #{del}"
    # end
    arrows = arrows.difference(del)
    # unless add.empty?
    #   puts "add #{add}"
    # end
    arrows += add
    # print_grid(enr_set)
  end
  enr_set.length
end

board = []
while line = gets
  board << line.strip
end
$L = board.length
# print grid
# print_grid(enr_set)

puts "part1 #{find_energy_from_input(Arrow.new(0, 0, 0), board)}"
max = -1
for i in 0...$L do
  e = find_energy_from_input(Arrow.new(i, 0, 0), board)
  if e > max
    max = e
  end
  e = find_energy_from_input(Arrow.new($L - 1, 0, 1), board)
  if e > max
    max = e
  end
  e = find_energy_from_input(Arrow.new(0, i, 3), board)
  if e > max
    max = e
  end
  e = find_energy_from_input(Arrow.new(0, $L - 1, 2), board)
  if e > max
    max = e
  end
end

puts "part2 #{max}"
