
def part1
  first = true
  s = 0
  ones = []
  zeros = []
  while l = gets
    if first
      s = l.size - 1
      ones = Array.new(s, 0)
      zeros = Array.new(s, 0)
      first = false
    end
    (0...s).each { |i|
      if l[i] == "0"
        zeros[i] += 1
      else
        ones[i] += 1
      end
    }
  end
  grs = ""
  ers = ""
  (0...s).each { |i|
    if (zeros[i] > ones[i])
      grs += "0"
      ers += "1"
    else
      grs += "1"
      ers += "0"
    end
  }
  gr = grs.to_i(2)
  er = ers.to_i(2)
  puts gr * er
end

def part2
  vals = []
  while l = gets
    vals << l
  end
  ogs = comp_rating(vals, true)
  cgs = comp_rating(vals, false)
  og = ogs.to_i(2)
  cg = cgs.to_i(2)
  puts og * cg
end

# c = true for mc
# c = false for lc
def comp_rating (arr, c)
  s = arr[0].size - 1

  pos = 0
  while true
    if arr.size == 1
      break
    end
    ones = 0
    zeros = 0
    arr.each { |l|
      if l[pos] == "0"
        zeros += 1
      else
        ones += 1
      end
    }
    # filter array
    # most common criteria
    if c
      if ones >= zeros
        arr = arr.select { |i| i[pos] == "1" }
      else
        arr = arr.select { |i| i[pos] == "0" }
      end
      # least common criteria
    else
      if zeros <= ones
        arr = arr.select { |i| i[pos] == "0" }
      else
        arr = arr.select { |i| i[pos] == "1" }
      end
    end
    pos += 1
  end
  arr[0]
end

$stdout.sync = true
part2