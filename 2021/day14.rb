# go in 2s
# insert
#

def part1(temp, h)
  new = ""
  10.times do
    l = temp.length
    (0...(l - 1)).each { |i|
      s = temp[i..(i + 1)]
      new << temp[i]
      if h[s].nil?
        next
      end
      new << h[s]
    }
    new << temp[l - 1]
    temp = new
    new = ""
    puts "#{temp.length}"
  end
  puts temp
  hash = Hash.new(0)
  temp.each_char { |c| hash[c] += 1 }
  min = 10000000000
  max = -1
  hash.each { |k, v|
    if v < min
      min = v
    end
    if v > max
      max = v
    end
  }
  puts "#{max - min}"
end

def part2(temp, h, n)
  # NC -> [NB, BC]
  pair = {}
  h.each do |p, i|
    s1 = p[0] + i
    s2 = i + p[1]
    pair[p] = [s1, s2]
  end
  # puts pair
  l = temp.length
  cntp = Hash.new(0)
  (0...(l - 1)).each { |i|
    s = temp[i..(i + 1)]
    cntp[s] += 1
  }
  puts cntp
  n.times do
    newcount = Hash.new(0)
    cntp.each { |p, v|
      s1, s2 = pair[p]
      puts "s1 = #{s1} s2 = #{s2}"
      newcount[s1] += v
      newcount[s2] += v
    }
    cntp = newcount
    puts cntp
    newcount = Hash.new(0)
  end
  puts cntp
  ccnt = Hash.new(0)
  cntp.each { |p, v|
    ccnt[p[0]] += v
  }
  ccnt[temp[temp.length-1]] += 1
  puts ccnt
  min = ccnt.values.min
  max = ccnt.values.max
  puts "#{max - min}"
end

temp = gets.strip!
gets
h = {}
while l = gets
  l.strip!
  x, y = l.split(" -> ")
  h[x] = y
end
#part1(temp, h)
part2(temp, h, 40)




