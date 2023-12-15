$stdout.sync = true

def hash(str)
  val = 0
  str.chars.each do |c|
    val += c.ord
    val = val * 17
    val = val % 256
  end
  val
end

def part1 (arr)
  count = 0
  arr.each do |i|
    count += hash(i)
  end
  count
end

def part2(arr)
  boxes = Array.new(256) { Hash.new }
  arr.each do |i|
    if i.include?("-")
      label = i.split("-")[0]
      box = hash(label)
      boxes[box].delete(label)
    else
      parse = i.split("=")
      label = parse[0]
      fl = parse[1].to_i
      box = hash(label)
      boxes[box][label] = fl
    end
  end
  fp = 0
  (0...256).each { |i|
    j = 1
    boxes[i].each { |k, v|
      fp += (i + 1) * j * v
      j += 1
    }
  }
  fp
end

line = gets
arr = line.strip.split(',')

puts "part1 #{part1(arr)}"
puts "part2 #{part2(arr)}"

