$stdout.sync = true
res = 0

# Complexity O(n^2)
def is_safe1 (line)
  arr = line.split.map(&:to_i)
  if check_safe_no_vol(arr)
    true
  end
  # check if removing 1 number from the list makes it safe
  # iterate through the list
  # remove 1 number from the list
  # check if the list is safe
  # if safe, return true
  # otherwise, return false
  for i in 0..arr.length - 1
    temp = arr.dup
    temp.delete_at(i)
    if check_safe_no_vol(temp)
      return true
    end
  end
  false
end

def check_safe_no_vol (arr)
  # iterate to compare 2 adjacent numbers in arr
  # puts arr
  # check increasing order
  if arr[0] < arr[1]
    for i in 0..arr.length - 2
      if arr[i] > arr[i + 1] || (arr[i + 1] - arr[i]) > 3 || (arr[i + 1] - arr[i]) < 1
        return false
      end
    end
  else
    # check decreasing order
    for i in 0..arr.length - 2
      if arr[i] < arr[i + 1] || (arr[i] - arr[i +1]) > 3 || (arr[i] - arr[i + 1]) < 1
        return false
      end
    end
  end
  true
end

# Complexity O(n)
# doesn't work for some cases. Ans 423 instead of 428
def is_safe1_op(line)
  arr = line.split.map(&:to_i)
  violation_index = check_safe_no_vol_op(arr)
  return true if violation_index == -1

  # Check if removing the element at the violation index or its neighbor makes the array safe
  [violation_index - 1, violation_index + 1].each do |i|
    next if i < 0 || i >= arr.length
    temp = arr.dup
    temp.delete_at(i)
    return true if check_safe_no_vol_op(temp) == -1
  end
  false
end

def check_safe_no_vol_op(arr)
  if arr[0] < arr[1]
    for i in 0..arr.length - 2
      if arr[i] > arr[i + 1] || (arr[i + 1] - arr[i]) > 3 || (arr[i + 1] - arr[i]) < 1
        puts "< i = #{i} arr = #{arr}"
        return i
      end
    end
  else
    for i in 0..arr.length - 2
      if arr[i] < arr[i + 1] || (arr[i] - arr[i + 1]) > 3 || (arr[i] - arr[i + 1]) < 1
        puts "> i = #{i} arr = #{arr}"
        return i
      end
    end
  end
  -1
end

while (line = gets)
  puts "read: " + line
  if is_safe1(line)
    res += 1
    puts "safe"
  end
end
puts res