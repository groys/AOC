# Created by IntelliJ IDEA.
# User: gautam.roy
# Date: 12/8/21
# Time: 8:54 PM
# To change this template use File | Settings | File Templates.
Point = Struct.new(:x, :y) do
  include Comparable

  def <=>(other)
    if self.x == other.x
      self.y <=> other.y
    end
    self.x <=> other.x
  end
end

def find_basin(a, i, j)
  queue = []
  v = {}
  m = a.size
  n = a[0].size

  queue.unshift(Point.new(i, j))
  until queue.empty?
    p = queue.pop
    i = p.x
    j = p.y
    v[p] = true
    if i - 1 >= 0 && a[i - 1][j] != 9
      new = Point.new(i - 1, j)
      unless v[new]
        queue.unshift(new)
      end
    end
    if i + 1 < m && a[i + 1][j] != 9
      new = Point.new(i + 1, j)
      unless v[new]
        queue.unshift(new)
      end
    end
    if j - 1 >= 0 && a[i][j - 1] != 9
      new = Point.new(i, j - 1)
      unless v[new]
        queue.unshift(new)
      end
    end
    if j + 1 < n && a[i][j + 1] != 9
      new = Point.new(i, j + 1)
      unless v[new]
        queue.unshift(new)
      end
    end
  end
  v.size
end

$stdout.sync = true
a = []
while l = gets
  l.strip!
  a << l.chars.map(&:to_i)
end
m = a.size
n = a[0].size
r = []
for i in 0...m
  for j in 0...n
    val = a[i][j]
    low = true
    #up
    if i - 1 >= 0
      low &= (a[i - 1][j] > val)
    end
    if i + 1 < m
      low &= (a[i + 1][j] > val)
    end
    if j - 1 >= 0
      low &= (a[i][j - 1] > val)
    end
    if j + 1 < n
      low &= (a[i][j + 1] > val)
    end
    if low
      #part 1
      #r += (val + 1)
      r << find_basin(a, i, j)
    end
  end
end
res = 1
res *= r.max
r.delete_at(r.index(r.max) || r.length)
res *= r.max
r.delete_at(r.index(r.max) || r.length)
res *= r.max
r.delete_at(r.index(r.max) || r.length)
puts res

#part 2
# find low points. For each low point BFS to find basin

