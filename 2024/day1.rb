def part2(left, right)
  res = 0
  for leftNum in left
    res += leftNum * right.count(leftNum)
  end
  puts res
end

def part1(left, right)
  res = 0
  left.sort!
  right.sort!
  for i in 0..left.length - 1
    res += (left[i] - right[i]).abs
  end
  puts res
end

$stdout.sync = true
left = []
right = []
while (line = gets)
  puts "read: " + line
  pair = line.split.map(&:to_i)
  left << pair[0]
  right << pair[1]
end
part2 left, right

