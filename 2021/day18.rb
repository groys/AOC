# Created by IntelliJ IDEA.
# User: gautam.roy
# Date: 12/17/21
# Time: 8:49 PM
# To change this template use File | Settings | File Templates.

require 'json'
# require 'test/unit/assertions'
# include Test::Unit::Assertions
# add one by one
# find magnitude of final recursively

def test_single_reduce(s1, s2)
  s, st = reduce(s1)
  assert_equal(s, s2)
end

def test_explode
  s1 = "[[[[[9,8],1],2],3],4]"
  s2 = "[[[[0,9],2],3],4]"
  test_single_reduce(s1, s2)
  test_single_reduce("[7,[6,[5,[4,[3,2]]]]]", "[7,[6,[5,[7,0]]]]")
  test_single_reduce("[[6,[5,[4,[3,2]]]],1]", "[[6,[5,[7,0]]],3]")
  test_single_reduce("[[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]", "[[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]")
  test_single_reduce("[[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]", "[[3,[2,[8,0]]],[9,[5,[7,0]]]]")
end

def test_add_2
  s1 = "[[[[4,3],4],4],[7,[[8,4],9]]]"
  s2 = "[1,1]"
  res = "[[[[0,7],4],[[7,8],[6,0]]],[8,1]]"
  assert_equal(add([s1, s2]), res)
end

def test_add
  res = "[[[[1,1],[2,2]],[3,3]],[4,4]]"
  lines = ["[1,1]", "[2,2]", "[3,3]", "[4,4]"]
  assert_equal(add(lines), res)
  res = "[[[[3,0],[5,3]],[4,4]],[5,5]]"
  lines = ["[1,1]", "[2,2]", "[3,3]", "[4,4]", "[5,5]"]
  assert_equal(add(lines), res)
  res = "[[[[5,0],[7,4]],[5,5]],[6,6]]"
  lines = ["[1,1]", "[2,2]", "[3,3]", "[4,4]", "[5,5]", "[6,6]"]
  assert_equal(add(lines), res)
  res = "[[[[4,0],[5,4]],[[7,7],[6,0]]],[[8,[7,7]],[[7,9],[5,0]]]]"
  lines = ["[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]", "[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]"]
  assert_equal(add(lines), res)
end

def is_num(e)
  Integer(e || '')
rescue ArgumentError
  nil
end

def add_left(arr, i, num)
  # puts "al i = #{i}, n = #{num}"
  while i >= 0
    left = is_num(arr[i])
    if !left.nil?
      left = left + num
      arr[i] = left.to_s
      return true
    end
    i -= 1
  end
  false
end

def add_right(arr, i, num)
  # puts "ar i = #{i}, n = #{num}"
  while i < arr.length
    right = is_num(arr[i])
    if !right.nil?
      right = right + num
      arr[i] = right.to_s
      return true
    end
    i += 1
  end
  false
end

def reduce(a)
  arr = a.split(/([\[,\,,\]])/).select { |x| !x.empty? }
  # puts "arr = #{arr}"
  # puts "reduce a = #{a}"
  if explode(arr)
    return [arr.join, true]
  end
  if split(arr)
    return [arr.join, true]
  end
  [arr.join, false]
end

def explode(arr)
  n = 0
  for i in 0...arr.length do
    e = arr[i]
    if e == "["
      n += 1
      next
    end
    if e == "]"
      n -= 1
      next
    end
    if e == ","
      next
    end
    num = e.to_i
    if num.nil?
      puts "ERRR"
      exit
    end
    # is it regular pair?
    if i < arr.length - 2
      r = is_num(arr[i + 2])
      if arr[i + 1] == "," && !r.nil? && n > 4
        # puts "boom n = #{n}"
        #find left
        l = add_left(arr, i - 1, num)
        # find right
        r = add_right(arr, i + 3, r)
        # replace with [a,b] -> 0
        arr.delete_at(i - 1)
        arr.delete_at(i - 1)
        arr.delete_at(i - 1)
        arr.delete_at(i - 1)
        arr.delete_at(i - 1)
        arr.insert(i - 1, 0)
        if l || r
          return true
        end
      end
    end
  end
  false
end

def split(arr)
  for i in 0...arr.length do
    e = arr[i]
    num = e.to_i
    if !num.nil? && num >= 10
      # puts "split"
      arr.delete_at(i)
      arr.insert(i, "[")
      arr.insert(i + 1, (num / 2.0).floor)
      arr.insert(i + 2, ",")

      arr.insert(i + 3, (num / 2.0).ceil)
      arr.insert(i + 4, "]")
      return true
    end
  end
  false
end

def magnitude(a)
  # puts "ma = #{a}"
  inp = JSON.parse(a)
  if inp.is_a? Integer
    inp
  else
    3 * magnitude(inp[0].to_s) + 2 * magnitude(inp[1].to_s)
  end

end

def add(lines)
  a = nil
  lines.each do |l|
    if a.nil?
      a = l
    else
      a = "[" + a + "," + l + "]"
      res = true
      while res
        a, res = reduce(a)
        # puts "a = #{a}"
      end
    end
  end
  a
end

def readin
  lines = []
  while l = gets
    l.strip!
    lines << l
  end
  lines
end

def find_max_magnitude(lines)
  max = -1
  for i in 0...lines.size
    for j in (i + 1)...lines.size
      # puts "#{i} #{j}"
      a = add([lines[i], lines[j]])
      m = magnitude(a)
      if max < m
        max = m
      end
    end
  end
  max
end

def part1(lines)
  m = magnitude(add(lines))
  puts "p1 = #{m}"
end

def part2(lines)
  puts "p2 = #{find_max_magnitude(lines)}"
end

lines = readin
part1(lines)
part2(lines)

