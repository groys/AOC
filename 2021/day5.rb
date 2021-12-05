# hash map
#
Point = Struct.new(:x, :y)
$stdout.sync = true
h = {}
while l = gets
  l = l.strip
  line = l.split("->").map { |x| x.split(",") }.map { |a| a.map { |p| p.to_i } }

  # horz line
  if line[0][0] == line[1][0]
    x = line[0][0]
    s = line[0][1]
    e = line[1][1]
    if s > e
      s, e = e, s
    end
    (s..e).each do |y|
      p = Point.new(x, y)
      if h[p].nil?
        h[p] = 1
      else
        h[p] += 1
      end
    end

    # vert line
  elsif line[0][1] == line[1][1]
    y = line[0][1]
    s = line[0][0]
    e = line[1][0]
    if s > e
      s, e = e, s
    end
    (s..e).each do |x|
      p = Point.new(x, y)
      if h[p].nil?
        h[p] = 1
      else
        h[p] += 1
      end
    end
    # diag line
  else
    x1 = line[0][0]
    x2 = line[1][0]
    xinc = x1 < x2 ? 1 : -1
    y1 = line[0][1]
    y2 = line[1][1]
    yinc = y1 < y2 ? 1 : -1
    i = 0
    # 8,0 0,8
    while i <= (y1-y2).abs
      x = x1 + i*xinc
      y = y1 + i*yinc
      p = Point.new(x, y)
      if h[p].nil?
        h[p] = 1
      else
        h[p] += 1
      end
      i += 1
    end
  end
end
s = h.select { |k, v| v >= 2 }.size
puts "s = #{s}"

