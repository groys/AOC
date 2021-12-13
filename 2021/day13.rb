def print2d(a)
  a.each { |e| puts "#{e}" }
end

def fold(f, pa)
  a = []
  if f[0] == "x"
    pa = pa.transpose
  end
  x = f[1].to_i
  a = pa[0...x]
  # puts "a"
  # print2d(a)
  (1..x).each { |i|
    (0...a[0].size).each { |j|
      a[x - i][j] = a[x - i][j] + pa[x + i][j] > 0 ? 1 : 0
    }
  }
  # puts "after fold"
  # print2d(a)
  if f[0] == "x"
    a = a.transpose
  end
  a
end


ps = []
while l = gets
  l.strip!
  if l.empty?
    break
  end
  ps << l.split(",").map(&:to_i)
end
#puts "ps = #{ps}"

f = []
while l = gets
  l.strip!
  f << l.split[2].split("=")
end
puts "f = #{f}"

mxp = ps.map { |x| x[0] }.max
myp = ps.map { |x| x[1] }.max
mxf = (f.filter{|ff| ff[0] == "x"}.map{|e| e[1].to_i}.max)*2
myf = (f.filter{|ff| ff[0] == "y"}.map{|e| e[1].to_i}.max)*2
puts "mxf = #{mxf}, myf = #{myf}"

mx = [mxp, mxf].max + 1
my = [myp, myf].max + 1

puts "mx = #{mx}, my = #{my}"
pa = Array.new(mx) { Array.new(my, 0) }
ps.each { |p|
  #puts "p = #{p}"
  pa[p[0]][p[1]] = 1
}
pa = pa.transpose
#print2d(pa)
f.each {|ff|
  puts "#{ff}"
  pa = fold(ff, pa)
  #print2d(pa)
}
print2d(pa)
puts "s = #{pa.map(&:sum).sum}"
