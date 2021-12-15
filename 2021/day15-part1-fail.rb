# memoization
def print2d(a)
  a.each { |e| puts "#{e}" }
end

def calc(i, j)
  if i < 0 || i > $L - 1 || j < 0 || j > $L - 1
    return $MAX
  end
  #puts "#{i} #{j}"
  if $risk[i][j] != $MAX
    $risk[i][j]
  else
    r1 = calc(i + 1, j)
    r2 = calc(i, j + 1)

    $risk[i][j] = i == 0 && j == 0 ? [r1, r2].min : $a[i][j] + [r1, r2].min
  end
end

$a = []
while l = gets
  l.strip!
  $a << l.chars.map(&:to_i)
end
#puts "#{$a}"
$MAX = 10000
$L = $a.length
#puts $L
$risk = Array.new($L) {
  Array.new($L, $MAX)
}
$risk[$L - 1][$L - 1] = $a[$L - 1][$L - 1]
#print2d($risk)
calc(0, 0)
print2d($risk)


