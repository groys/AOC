# Created by IntelliJ IDEA.
# User: gautam.roy
# Date: 12/10/21
# Time: 8:19 PM
# To change this template use File | Settings | File Templates.

# step
# i, j increase by 1
# add i,j > 9 to queue
# while queue not empty process i, j,

# how to process a grid
xm = [[-1, -1, -1], [0, 0, 0], [1, 1, 1]]
ym = [[-1, 0, 1], [-1, 0, 1], [-1, 0, 1]]

Point = Struct.new(:x, :y)

a = []
while l = gets
  l.strip!
  a << l.chars.map(&:to_i)
end
# puts "#{a}"
step = 0
while true
  step += 1
  q = []
  sum = 0
  # increase by 1
  for i in 0...10
    for j in 0...10
      a[i][j] += 1
      if a[i][j] > 9
        p = Point.new(i, j)
        q.unshift(p)
        sum += 1
        if sum == 100
          puts step
          exit
        end
        # s << p
        a[i][j] = 0
      end
    end
  end
  until q.empty?
    p = q.pop
    for i in 0...3
      for j in 0...3
        x = p.x + xm[i][j]
        y = p.y + ym[i][j]
        if x < 0 || x > 9 || y < 0 || y > 9
          next
        end
        if a[x][y] == 0
          next
        end
        if a[x][y] == 9
          a[x][y] = 0
          q.unshift(Point.new(x,y))
          sum += 1
          if sum == 100
            puts step
            exit
          end
        else
          a[x][y] += 1
        end
      end
    end
  end
end
# puts sum