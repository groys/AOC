

def getNum(line)
  #puts line
  f = ''
  line.each_char do |c|
    if c >= '0' && c <= '9'
      f = c
      break
    end
  end
  #puts f
  l = ''
  index = line.length - 1
  while index >= 0
    c = line[index]
    if c >= '0' && c <= '9'
      l = c
      break
    end
    index -= 1
  end
  10 * (f.to_i) + l.to_i
end
nums = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
$stdout.sync = true
res = 0
while line = gets
  res += getNum(line)
end
puts res
