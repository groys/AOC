
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

def getNumwithWord(line)
  nums = {"one": "1", "two": "2", "three":"3", "four":"4", "five":"5", "six":"6", "seven":"7", "eight":"8", "nine":"9"}
  firstNum = -1
  lastNum = -1
  firstIdx = line.length
  lastIdx = -1
  nums.each do |k,v|
    ks = k.to_s

    id = line.index(ks)
    if !id.nil? && id < firstIdx
      firstIdx = id
      firstNum = v
    end
    id = line.index(v)
    if !id.nil? && id < firstIdx
      firstIdx = id
      firstNum = v
    end

    rid = line.rindex(ks)
    if !rid.nil? && rid > lastIdx
      lastIdx = rid
      lastNum = v
    end
    rid = line.rindex(v)
    if !rid.nil? && rid > lastIdx
      lastIdx = rid
      lastNum = v
    end
  end
  10 * (firstNum.to_i) + lastNum.to_i
end

$stdout.sync = true
res = 0
while line = gets
  puts line
  res += getNumwithWord(line)
end
puts res
