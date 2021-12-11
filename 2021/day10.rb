# Created by IntelliJ IDEA.
# User: gautam.roy
# Date: 12/9/21
# Time: 8:35 PM
# To change this template use File | Settings | File Templates.
$stdout.sync = true
o = ["{", "(", "[", "<"]
c = ["}", ")", "]", ">"]
pair = { "{" => "}", "(" => ")", "[" => "]", "<" => ">" }
h1 = { ")" => 3, "]" => 57, "}" => 1197, ">" => 25137 }
h2 = { ")" => 1, "]" => 2, "}" => 3, ">" => 4 }

scores =[]
while l = gets
  l.strip!
  puts l
  stack = []
  inc = true
  l.each_char do |c|
    if o.include?(c)
      stack.push(c)
    else
      p = stack.pop
      if pair[p] != c
        inc = false
        break
      end
    end
  end
  str = []
  if inc
    sc = 0
    while !stack.empty?
      p = stack.pop
      sc = sc*5 + h2[pair[p]]
      str << pair[p]
    end
    scores << sc
    puts "str = #{str}"
  end
end
scores.sort!
puts "scores = #{scores}"
puts "#{scores.size/2}"
puts scores[(scores.size/2)]
