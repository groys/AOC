class Board
  @rows = []
  @cols = []

  # arr of strings
  def initialize (arr)
    @rows = []
    arr.each do |a|
      @rows << a.split.map(&:to_i)
    end
    @cols = @rows.transpose
  end

  def fill(n)
    br = false
    @rows.each do |r|
      r.delete(n)
      if r.length == 0
        br = true
      end
    end

    @cols.each do |c|
      c.delete(n)
      if c.length == 0
        br = true
      end
    end
    if br
      return true
    end
    false
  end

  def cal
    n = 0
    @rows.each do |r|
      n += r.sum
    end
    n
  end
end

$stdout.sync = true
vals = []
boards = []
f = gets
nums = f.split(',').map(&:to_i)
gets
while l = gets
  l = l.strip
  if l.empty?
    b = Board.new(vals)
    boards << b
    vals = []
    next
  end
  vals << l
end
boards << Board.new(vals)
done = 0
skip = Array.new(boards.size, false)
nums.each { |n|
  if done == boards.size
    break
  end
  boards.each_with_index { |b, i|
    if !skip[i] && b.fill(n)
      done += 1
      skip[i] = true
      if done == boards.size
        puts "n = #{n} cal=#{b.cal} ans= #{n*b.cal}"
        break
      end
    end
  }
}


