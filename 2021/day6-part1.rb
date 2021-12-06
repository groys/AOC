# Created by IntelliJ IDEA.
# User: gautam.roy
# Date: 12/5/21
# Time: 3:39 PM
# To change this template use File | Settings | File Templates.

def part1 (a, num)
  num.times do
    add = 0
    a = a.map { |x|
      if x == 0
        x = 6
        add += 1
      else
        x = x - 1
      end
      x
    }
    add.times {
      a << 8
    }
  end
  a.size
end



$stdout.sync = true
a = gets.split(',').map(&:to_i)
#puts "a = #{a}"
puts "a = #{part1(a, 80)}"


