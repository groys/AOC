$stdout.sync = true

def race(d, t)
  j = 1
  count = 0
  while j < t
    if j * (t - j) > d
      count += 1
    end
    j += 1
  end
  count
end

def count(dist, times)
  ret = 1
  i = 0
  while i < times.length
    t = times[i]
    d = dist[i]
    count = race(d, t)
    ret *= count
    i += 1
  end
  ret
end

def part1
  times = gets.split(":")[1].split().map(&:to_i)
  puts "times #{times}"
  dist = gets.split(":")[1].split().map(&:to_i)
  puts "dist #{dist}"
  ret = count(dist, times)
  ret
end

def part2
  t = gets.split(":")[1].split().join("").to_i
  d = gets.split(":")[1].split().join("").to_i
  race(d, t)
end

#puts "part1 #{part1}"
puts "part2 #{part2}"



