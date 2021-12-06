# Created by IntelliJ IDEA.
# User: gautam.roy
# Date: 12/6/21
# Time: 12:53 AM
# To change this template use File | Settings | File Templates.
def procreate(a, days)
  # number of fish of each denomination
  n = Array.new(9, 0)
  a.each {|x| n[x] += 1}
  puts "n = #{n}"

  total = a.size
  days.times do
    new = n[0]
    n[0] = n[1]
    n[1] = n[2]
    n[2] = n[3]
    n[3] = n[4]
    n[4] = n[5]
    n[5] = n[6]
    n[6] = n[7] + new
    n[7] = n[8]
    n[8] = new
    total += new
    # puts "n = #{n}"
    # puts "new = #{new}"
  end
  total
end
a = gets.split(',').map(&:to_i)
puts "a = #{a}"
puts "#{procreate(a, 256)}"

