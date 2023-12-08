$stdout.sync = true

def part1
  count = 0
  i = 0
  st = "AAA"
  en = "ZZZ"

  while true
    if st == en
      break
    end
    if i == RL.length
      i = 0
    end
    if RL[i] == 'R'
      st = $h[st][1]
    else
      st = $h[st][0]
    end
    # puts "RL = #{RL[i]} st = #{st}"
    i += 1
    count += 1
  end
  puts "part1 #{count}"
end

def part2
  starts = $h.filter { |k, _| k[2] == 'A' }.keys
  ends = $h.filter { |k, _| k[2] == 'Z' }.keys
  # puts "ends = #{ends}"
  counts = []
  starts.each { |st|
    count = 0
    i = 0
    while true
      if st[2] == 'Z'
        break
      end
      if i == RL.length
        i = 0
      end
      if RL[i] == 'R'
        st = $h[st][1]
      else
        st = $h[st][0]
      end
      # puts "RL = #{RL[i]} st = #{st}"
      i += 1
      count += 1
    end
    counts << count
  }
  # puts "counts = #{counts}"
  lcm_result = counts.reduce(1) { |lcm, number| lcm.lcm(number) }
  puts "part2 #{lcm_result}"
end

# follow LR
$h = {}
RL = gets.chomp
gets
while line = gets
  arr = line.split("=")
  arr[1] = arr[1].delete('(')
  arr[1] = arr[1].delete(')')
  $h[arr[0].strip] = arr[1].split(",").map { |i| i.strip }
end
# puts $h
part1()
part2()