$stdout.sync = true
g = 1
rmax = 12
gmax = 13
bmax = 14
res = 0
while line = gets
  arr = line.split(':')
  line = arr[1]
  arr = line.split(';')
  # arr = [" 3 blue, 4 red", " 1 red, 2 green, 6 blue", " 2 green"]
  valid = true
  for s in arr
    # s = " 3 blue, 4 red"
    for token in s.split(',')
      ns, w = token.split
      if (w.start_with?('b') && ns.to_i > bmax) ||  (w.start_with?('g') && ns.to_i > gmax) ||  (w.start_with?('r') && ns.to_i > rmax)
        valid = false
        break
      end
    end
    if !valid
      break
    end
  end
  if valid
    res += g
  end
  g += 1
end
puts res
