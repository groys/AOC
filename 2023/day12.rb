$stdout.sync = true
Row = Struct.new(:str, :groups)

def countGroups(row_str)
  #puts "str = #{row_str}"
  groups = []
  c = 0
  i = 0
  while i < row_str.length
    if row_str[i] == '#'
      c += 1
    else
      if c != 0
        groups << c
        c = 0
      end
    end
    i += 1
  end
  if c != 0
    groups << c
  end
  groups
end

#return true if bins leads to matching groups
def try_s (row_str, bins, groups)
  #puts "row_str #{row_str}, bins #{bins} groups #{groups}"
  s = String.new(row_str)
  i = 0
  b = 0
  while i < s.length
    if s[i] == '?'
      if bins[b] == '0'
        s[i] = '.'
      else
        s[i] = '#'
      end
      b += 1
    end
    i += 1
  end
  g = countGroups(s)
  #puts "g = #{g} groups = #{groups}"
  groups == g
end

arr = []
count = 0
while line = gets
  a = line.split
  grps = a[1].split(',').map(&:to_i)
  arr << Row.new(a[0], grps)
end
puts "arr = #{arr}"
it = 0
arr.each do |r|
  puts "it = #{it}"
  q = r.str.count('?')
  bin_count = 2 ** q
  (0...bin_count).each { |i|
    bins = i.to_s(2)
    j = 0
    s = ""
    while j < q
      if j < q - bins.length
        s += '0'
      else
        s += bins
        break
      end
      j += 1
    end
    #puts "i = #{i} s = #{s}"
    if try_s(r.str, s, r.groups)
      #puts "found"
      count += 1
    end
  }
  it += 1
end
puts "part1 #{count}"
