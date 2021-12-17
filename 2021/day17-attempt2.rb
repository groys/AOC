def part1(yr)
  last = (yr[0].to_i + 1).abs
  puts "#{last * (last + 1) / 2}"
end

def part2
  x1, x2 = 79, 137
  y1, y2 = -176, -117
  r = 0
  for yvel in (y1..1000)
    for xvel in 0..x2 + 1
      x, y = 0, 0

      xv = xvel
      yv = yvel
      while true
        x += xv
        y += yv
        if xv != 0
          xv -= 1
        end
        yv -= 1
        if x1 <= x && x <= x2 && y1 <= y && y <= y2
          r += 1
          break
        end
        if y < y1 || x > x2
          break
        end
      end
    end
  end
  puts r
end

x1, x2 = 79, 137
y1, y2 = -176, -117
part1([y1, y2])
part2
