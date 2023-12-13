$stdout.sync = true

def print_arr (arr, print_str)
  unless print_str.nil?
    puts print_str
  end
  arr.each { |i|
    puts i
  }
end

def diff_count (s1, s2)
  d = 0
  (0...s1.length).each do |i|
    if s1[i] != s2[i]
      d += 1
    end
  end
  d
end

def find_mirror (pattern, exp_count)
  (1...pattern.length).each do |l|
    # puts "l #{l}"
    i = 0
    diff = 0
    while l + i < pattern.length && l - i - 1 >= 0
      diff += diff_count(pattern[l - i - 1], pattern[l + i])
      i += 1
    end
    if diff == exp_count
      # puts "found #{l}"
      return l
    end
  end
  -1
end

def summarize(arr, exp_count)
  count = 0
  arr.each { |pattern|
    # test horz line
    # print_arr(pattern, "pattern")
    l = find_mirror(pattern, exp_count)
    if l != -1
      count += 100 * l
      next
    end
    t_pattern = pattern.map(&:chars).transpose.map(&:join)
    # print_arr(t_pattern, "t_p")

    # test vert line
    m = find_mirror(t_pattern, exp_count)
    count += m
  }
  count
end

arr = []
elem = []
i = 0
while line = gets
  if line.strip!.empty?
    i += 1
    arr << elem
    elem = []
  else
    elem << line
  end
end
arr << elem
# print_arr(arr, "arr")

puts "part1 #{summarize(arr, 0)}"
puts "part2 #{summarize(arr, 1)}"
