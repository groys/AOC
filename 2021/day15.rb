def print2d(a)
  a.each { |e| puts "#{e}" }
end

# Not using Dijkstra
# Maintain $d which captures risk of traversing from i,j to right bottom
# Start from bottom right corner. Maintain queue of vertexes that you encounter
# relax (clrs) each non-diagonal edge you encounter
# queue vertex if its d changes
# mind the 0, 0 vertex to not add its cost
def compute_dist
  $d = Array.new($L) {
    Array.new($L, $MAX)
  }
  $d[$L - 1][$L - 1] = $a[$L - 1][$L - 1]
  q = []
  q.unshift([$L - 1, $L - 1])
  until q.empty?
    m, n = q.pop
    #check all 4 directions
    c = 0
    (0...4).each { |i|
      x = $xm[i] + m
      y = $ym[i] + n
      if x >= 0 && x <= $L - 1 && y >= 0 && y <= $L - 1
        unless y == 0 && x == 0
          c = $a[x][y]
        end
        if $d[x][y] > $d[m][n] + c
          $d[x][y] = $d[m][n] + c
          q.unshift([x, y])
        end
      end
    }
  end
  puts "#{$d[0][0]}"
end

def increment
  (0...$LL).each { |i|
    (0...$LL).each { |j|
      $aa[i][j] = $aa[i][j] == 9 ? 1 : $aa[i][j] + 1
    }
  }
end

$xm = [0, 0, -1, 1]
$ym = [-1, 1, 0, 0]
$aa = []
while l = gets
  l.strip!
  $aa << l.chars.map(&:to_i)
end
$MAX = 100000
$LL = $aa.length
$L = 5 * $LL

$a = Array.new($L) {
  Array.new($L, -1)
}
step = 0
while step < 9
  if step != 0
    increment
  end

  if step > 4
    y = 4
    x = step - y
  else
    y = step
    x = 0
  end

  while x <= 4 && y >= 0
    (0...$LL).each { |i|
      (0...$LL).each { |j|
        $a[$LL * x + i][$LL * y + j] = $aa[i][j]
      }
    }
    y -= 1
    x += 1
  end
  step += 1
end
compute_dist
