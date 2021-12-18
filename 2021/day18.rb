# Created by IntelliJ IDEA.
# User: gautam.roy
# Date: 12/17/21
# Time: 8:49 PM
# To change this template use File | Settings | File Templates.

require 'json'
# add one by one
# find magnitude of final recursively

def is_num(e)
  Integer(e || '')
rescue ArgumentError
  nil
end

def add_left(arr, i, num)
  puts "al i = #{i}, n = #{num}"
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
  puts "ar i = #{i}, n = #{num}"
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

def reduce(arr, st, ns)
  puts "reduce arr = #{arr.join} st = #{st} ns = #{ns}"
  sleep(1)
  n = ns
  for i in st...arr.length do
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
    # is it regular pair?
    if i < arr.length - 2
      r = is_num(arr[i + 2])
      if arr[i + 1] == "," && !r.nil? && n > 4
        puts "boom n = #{n}"
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
          reduce(arr, st, ns)
        else
          reduce(arr, i, n)
        end
      end
    end
    if num >= 10
      puts "split"
      arr.delete_at(i)
      arr.insert(i, "[")
      arr.insert(i + 1, (num / 2.0).floor)
      arr.insert(i + 2, ",")

      arr.insert(i + 3, (num / 2.0).ceil)
      arr.insert(i + 4, "]")
      reduce(arr, st, ns)
    end
  end
end

def magnitude

end

a = nil
while l = gets
  l.strip!
  if a.nil?
    a = JSON.parse(l)
    puts "a1 = #{a}"
  else
    a = [a, JSON.parse(l)]
    puts "a2 = #{a}"
    s = a.to_json
    puts "s1 = #{s}"
    arr = s.split(/([\[,\,,\]])/).select { |x| !x.empty? }
    puts "arr = #{arr}"
    reduce(arr, 0, 0)
    s = arr.join
    puts "s = #{s}"
    a = JSON.parse(s)
    puts "a = #{a}"
  end
end
puts "#{a}"