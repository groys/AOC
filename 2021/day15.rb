def print2d(a)
  a.each { |e| puts "#{e}" }
end

def compute_dist
  $d = Array.new($L) {
    Array.new($L, $MAX)
  }
  $d[$L - 1][$L - 1] = $a[$L - 1][$L - 1]
  q = []
  q.unshift([$L - 1, $L - 1])
  until q.empty?
    x, y = q.pop
    if x == 0 && y == 0
      $d[x][y] = [$d[x + 1][y], $d[x][y + 1]].min
      next
    end
    #check all 4 directions
    c = 0
    if y - 1 >= 0
      unless y - 1 == 0 && x == 0
        c = $a[x][y - 1]
      end
      if $d[x][y - 1] > $d[x][y] + c
        $d[x][y - 1] = $d[x][y] + c
        q.unshift([x, y - 1])
      end
    end
    if y + 1 <= $L - 1
      c = $a[x][y + 1]
      if $d[x][y + 1] > $d[x][y] + c
        $d[x][y + 1] = $d[x][y] + c
        q.unshift([x, y + 1])
      end
    end
    if x - 1 >= 0
      unless y == 0 && x - 1 == 0
        c = $a[x - 1][y]
      end
      if $d[x - 1][y] > $d[x][y] + c
        $d[x - 1][y] = $d[x][y] + c
        q.unshift([x - 1, y])
      end
      if x + 1 <= $L - 1
        c = $a[x + 1][y]
        if $d[x + 1][y] > $d[x][y] + c
          $d[x + 1][y] = $d[x][y] + c
          q.unshift([x + 1, y])
        end
      end
    end
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
  p "step = #{step}"
  print2d($aa)
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
        #puts "i = #{$LL * x + i} j = #{$LL * y + j}"
      }
    }
    y -= 1
    x += 1
  end
  step += 1
end
#print2d($a)
# how to co
compute_dist
