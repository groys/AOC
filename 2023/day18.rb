$stdout.sync = true
$MAX = 20000
# array of minx, maxx
x = []
for i in 0...$MAX
  x[i] = [$MAX, -$MAX]
end
currx, curry = 1, 1
x[10000] = [0, 1]


while line = gets
  a = line.split
  case a[0]
  when 'U'

  when 'D'
    n = a[1].to_i

  when 'R'
    x[currx][1] = x[currx][1] + a[1].to_i
  when 'L'
    x[currx][1] = x[currx][1] + a[1].to_i
  else
    break
  end
end
ret = 0
x.each do |mm|
  if mm[0] < $MAX
    ret += (mm[1] - mm[0])
  end
end
puts "part1 #{ret}"
# minx, maxx for each y
