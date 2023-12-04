require 'set'
$stdout.sync = true

# insert numbers in set
# check if included count

def part1
  sum = 0
  while line = gets
    nums = line.split(":")[1].split("|")
    win = Set.new
    win += nums[0].split

    n = 0
    nums[1].split.each do |i|
      if win.include? i
        n += 1
      end
    end
    if n != 0
      sum += 2 ** (n - 1)
    end
  end
  puts sum
end

# For each card you have a few things
# 1. Number of winning matches
# 2. The set of cards it produces
# 3. Number of cards of this type
# Data structure hash cid -> {[cards produced], num of cards of this type}

Card = Struct.new(:wins, :num)
cno = 1
chash = {}
while line = gets
  nums = line.split(":")[1].split("|")
  win = Set.new
  win += nums[0].split
  # nums[0].split.each do |i|
  #   win << i
  # end

  n = 0
  nums[1].split.each do |i|
    if win.include? i
      n += 1
    end
  end
  wins = []
  while n > 0
    wins << cno + n
    n -= 1
  end
  chash[cno] = Card.new(wins, 1)
  cno += 1
end
puts chash

chash.each { |_, v|
  v.wins.each { |id|
    chash[id].num += v.num
  }
}
sum = 0
chash.each { |_, v|
  sum += v.num
}
puts sum
