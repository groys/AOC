#update midnight need to enforce that groups need to be contiguous
# s = "??.###" and [1, 1, 3] is returning 5 instead of 0
$stdout.sync = true
Key = Struct.new(:i, :j, :arr)
# i, j groups[] => count
$mem = {}

def rec(s, i, j, groups)
  puts "s #{s} i #{i} j #{j} g #{groups}"
  grpsum = groups.sum
  if grpsum > j - i + 1
    return 0
  end
  k = Key.new(i, j, groups)
  if $mem.include?(k)
    return $mem[k]
  end
  # base case 1
  if i == j
    if groups.empty?
      if s[i] == '.' || s[i] == '?'
        $mem[k] = 1
        return 1
      else
        $mem[k] = 0
        return 0
      end
    else
      if s[i] == '#' || s[i] == '?'
        $mem[k] = 1
        return 1
      else
        $mem[k] = 0
        return 0
      end
    end
  end
  # base case 2
  if grpsum == j - i + 1 && groups.length == 1
    if s[i..j].count('#') + s[i..j].count('?') == grpsum
      $mem[k] = 1
      return 1
    end
  end
  m = i
  ret = 0
  while m < j
    n = 0
    while n <= groups.length
      r = (rec(s, i, m, groups[0...n]) * rec(s, m + 1, j, groups[n...groups.length]))
      if (i == 0 && j == 6)
        puts "s1 = #{s[i..m]} s2 = #{s[(m+1)..j]} g1 = #{groups[0...n]} g2 = #{groups[n...groups.length]} r = #{r}"
      end
      ret += r
      n += 1
    end
    m += 1
  end
  $mem[k] = ret
  ret
end

count = 0

while line = gets
  a = line.strip.split
  grps = a[1].split(',').map(&:to_i)
  $mem = {}
  c = rec(a[0], 0, a[0].length - 1, grps)
  puts "s = #{a[0]} c = #{c}"
  count += c
end

$mem.each_pair do |key, value|
  puts "#{key}: #{value}"
end
puts "part1 #{count}"