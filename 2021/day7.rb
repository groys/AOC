# Created by IntelliJ IDEA.
# User: gautam.roy
# Date: 12/6/21
# Time: 8:57 PM
# To change this template use File | Settings | File Templates.
# Time Complexity O(N^2)
def comp_dist(point)
  $a.reduce(0) { |sum, num| sum + (num - point).abs }
end

def comp_rate_dist(point)
  $a.reduce(0) do |sum, num|
    sum + ((num - point).abs * ((num - point).abs + 1) / 2)
  end
end

def part1
  min = $a.min { |a, b| comp_dist(a) <=> comp_dist(b) }
  puts "part1 min = #{min} dist = #{comp_dist(min)}"
end

def part2
  mina = $a.min
  maxa = $a.max
  min = mina
  for i in mina..maxa do
    if comp_rate_dist(i) < comp_rate_dist(min)
      min = i
    end
  end
  puts "part2 min = #{min} dist = #{comp_rate_dist(min)}"
end

$stdout.sync = true
$a = gets.split(",").map(&:to_i)
part1
part2
