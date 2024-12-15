# Regular expression to match "mul(x,y)" where x and y are numbers
$enabled = true

def match_mul(line)
  regex1 = /mul\((\d+),(\d+)\)/
  res = 0
  matches = line.scan(regex1)
  matches.each do |match|
    puts "Found match: #{match}"
    res += (match[0].to_i * match[1].to_i)
  end
  res
end

def match_mul_do_dont(line)
  regex2 = /
    mul\((?<x>\d+),(?<y>\d+)\) |     # Match mul(x,y) with named captures x and y
    (?<do>do\(\)) |                 # Match do()
    (?<dont>don't\(\))              # Match don't()
  /x
  res = 0
  matches = line.scan(regex2)
  puts "Found matches: #{matches}"
  matches.each do |mul_x, mul_y, do_match, dont_match|
    if mul_x && mul_y && $enabled
      # puts "mul #{mul_x} #{mul_y}"
      res += mul_x.to_i * mul_y.to_i
    elsif do_match
      # puts "do"
      $enabled = true
    elsif dont_match
      # puts "don't"
      $enabled = false
    end
  end
  res
end

res = 0
while (line = gets)
  # res = match_mul(line)
  r = match_mul_do_dont(line)
  puts "r = #{r}"
  res += r
end
puts res

