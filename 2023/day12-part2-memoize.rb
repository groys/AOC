$stdout.sync = true
Key = Struct.new(:i, :j, :arr)
# i, j groups[] => count
$mem = {}

def rec(s, i, j, groups)
  puts "s #{s} i #{i} j #{j} g #{groups}"
  if groups.sum > j - i - 1
    0
  end
  k = Key.new(i, j, groups)
  # base case
  if i == j
    $mem[k] = 1
    return 1
  end
  if $mem.include?(k)
    return $mem[k]
  end
  m = i
  ret = 0
  n = 0
  while m < s.length
    while n - 1 < groups.length
      ret += (rec(s, i, m, groups[0..n]) * rec(s, m + 1, j, groups[n..-1]))
      n += 1
    end
    m += 1
  end
  $mem[k] = ret
  ret
end

count = 0
while line = gets
  a = line.split
  grps = a[1].split(',').map(&:to_i)
  $mem = {}
  count += rec(a[0], 0, a[0].length - 1, grps)
end

puts "part1 #{count}"