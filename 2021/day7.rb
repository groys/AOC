# Created by IntelliJ IDEA.
# User: gautam.roy
# Date: 12/6/21
# Time: 8:57 PM
# To change this template use File | Settings | File Templates.

def comp_dist(point)
  $a.reduce(0) { |sum, num| sum + (num - point).abs }
end

def comp_rate_dist(point)
  $a.reduce(0) do |sum, num|
    sum + ((num - point).abs * ((num - point).abs + 1) / 2)
  end
end

$stdout.sync = true
$a = gets.split(",").map(&:to_i)
mina = $a.min
maxa = $a.max
min = mina
for i in mina..maxa do
  if (comp_rate_dist(i) < comp_rate_dist(min))
    min = i
  end
end

#min = $a.min { |a, b| comp_rate_dist(a) <=> comp_rate_dist(b) }
#puts "a = #{a}"
puts "min = #{min} dist = #{comp_rate_dist(min)}"