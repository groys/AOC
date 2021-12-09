# Created by IntelliJ IDEA.
# User: gautam.roy
# Date: 12/7/21
# Time: 8:48 PM
# To change this template use File | Settings | File Templates.

def part1
  s = 0
  while l = gets
    s += l.split(" | ")[1].split(" ").filter { |x| x.length == 2 || x.length == 4 || x.length == 3 || x.length == 7 }.size
  end
  puts s
end



#0 6
#1 2*
# 2 5*
# 3 5*
# 4 4*
# 5 5*
# 6 6*
# 7 3*
# 8 7*
# 9 6

# find the combos for 1,4,7,8
# from 7 and 1 whats a, and the pair c,f
# using cf find combo for 3 of size 5 //3
# using 4 find combo for 9 of size 6 contains // 9
#
# combo for 2 should have 2 letters in common with 4 //2
# combo for 5 should have 3 letters in common with 4 //5
# using cf find combo of size 6 that doesn't have cf is 6//6
# the other combo of size 6 is 0 //0

def contains_all_chars(arr, num)
  ret = nil
  arr.each { |s|
    found = true
    num.each_char { |x| found &= s.include?(x) }
    if found
      ret = s
    end
  }
  ret
end

def count_contain_chars(arr, num, target)
  ret = nil
  arr.each { |s|
    count = 0
    num.each_char {|x|
      if s.include?(x)
        count += 1
      end
    }
    if count == target
      ret = s
    end
  }
  ret
end

# sort all the strings
# hash of string to int value
def part2
  s = 0
  while l = gets
    a = l.split(" | ").map { |x| x.split(" ").map { |s| s.chars.sort.join } }
    puts "a = #{a}"
    hash = {}
    sig = a[0]
    out = a[1]
    one = sig.find { |s| s.length == 2 }
    hash[one] = 1
    four = sig.find { |s| s.length == 4 }
    hash[four] = 4
    seven = sig.find { |s| s.length == 3 }
    hash[seven] = 7
    eight = sig.find { |s| s.length == 7 }
    hash[eight] = 8
    fivelengths = sig.filter { |s| s.length == 5 }
    sixlengths = sig.filter { |s| s.length == 6 }
    three = contains_all_chars(fivelengths, one)
    hash[three] = 3
    fivelengths.delete(three)
    nine = contains_all_chars(sixlengths, four)
    hash[nine] = 9
    sixlengths.delete(nine)
    two = count_contain_chars(fivelengths, four, 2)
    hash[two] = 2
    fivelengths.delete(two)
    five = fivelengths[0]
    hash[five] = 5
    zero = contains_all_chars(sixlengths, one )
    hash[zero] = 0
    sixlengths.delete(zero)
    six = sixlengths[0]
    hash[six] = 6
    n = 1000
    out.each do |o|
      s += hash[o]*n
      n = n/10
    end
  end
  puts s
end

$stdout.sync = true
part2
