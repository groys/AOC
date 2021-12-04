class Board
  @rows = []
  @cols = []

  # arr of strings
  def initialize (arr)
    @rows = []
    arr.each do |a|
      s = a.split
      @rows << s.map(&:to_i)
    end
    @cols = @rows.transpose
    puts "rows #{@rows}"
    puts "cols #{@cols}"
  end

  def fill(n)
    puts "n #{n}"
    br = false
    @rows.each do |r|
      puts "r1 = #{r}"
      r.delete(n)
      puts "r2 = #{r}"
      if r.nil? || r.length == 0
        br = true
      end
    end

    @cols.each do |c|
      c.delete(n)
      if c.nil? || c.length == 0
        br = true
      end
    end
    if br
      puts "b2 #{br}"
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
puts "nums = #{nums}"
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
puts "hello"
done = false
nums.each { |n|
  if done
    break
  end
  boards.each { |b|
    if b.fill(n)
      puts "ans=#{n*b.cal}"
      done = true
      break
    end
  }
}


