$stdout.sync = true

g = 1
res = 0
while line = gets
  arr = line.split(':')
  line = arr[1]
  arr = line.split(';')
  # arr = [" 3 blue, 4 red", " 1 red, 2 green, 6 blue", " 2 green"]
  rm = -1
  gm = -1
  bm = -1
  for s in arr
    # s = " 3 blue, 4 red"
    for token in s.split(',')
      ns, w = token.split
      n = ns.to_i
      if (w.start_with?('b') && n > bm)
        bm = n
      end
      if (w.start_with?('g') && n > gm)
        gm = n
      end
      if (w.start_with?('r') && n > rm)
        rm = n
      end
    end
  end
  res += (rm * gm * bm)
  g += 1
end
puts res

