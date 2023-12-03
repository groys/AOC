$stdout.sync = true

# Part 1
# Block around number iterate to see if any symbol
# iterate over string. find startind s and endindex e of number iterate of
#
# Part 2
# Create symbol adjacency hash, so don't break out of loop


def isNum(s)
  if s >= '0' && s <= '9'
    return true
  end
  false
end

def isSym(s)
  if s != '.' && !isNum(s)
    return true
  end
  false
end

def populate_hash(num, i, j, sym_hash)
  p = Point.new(i, j)
  if sym_hash[p].nil?
    sym_hash[p] = [num]
  else
    sym_hash[p] << num
  end
end

Point = Struct.new(:i, :j)

sym_hash = {}
arr =[]
while line = gets
  arr << line.chomp
end
sum = 0


for i in 0...arr.length do
  j = 0
  while j < arr[i].length do

    # find a num
    if isNum(arr[i][j])
      s = j
      num = arr[i][j].to_i
      #puts "first digit = #{num}"
      j += 1
      while j < arr[i].length && isNum(arr[i][j]) do
        dig = arr[i][j].to_i
        #puts "dig = #{dig}"
        num = num*10 + dig
        j += 1
      end
      #puts "num = #{num}"
      e = j - 1
      # iterate over box around i,s and i,e i.e. box formed by (i-1, s-1), (i-1,e+1) to (i+1, s-1) to (i+1,e+1)
      st = (s - 1 >= 0) ? (s - 1) : s
      en = (e + 1 < arr[i-1].length) ? (e+1) : e
      # line above
      if i - 1 >= 0
        #found = false
        for it in st..en
          if isSym(arr[i-1][it])
            populate_hash(num, i-1, it, sym_hash)
            #found = true
          end
        end
        # if found
        #   #puts "sym adjacent 1"
        #   sum += num
        #   next
        # end
      end
      # same line
      if isSym(arr[i][st])
        populate_hash(num, i, st, sym_hash)
      end
        if   isSym(arr[i][en])
          populate_hash(num, i, en, sym_hash)
        #puts "sym adjacent 2"
        # sum += num
        # next
        end
      # lower line
      if i + 1 < arr.length
        #found = false
        for it in st..en
          if isSym(arr[i+1][it])
            populate_hash(num, i+1, it, sym_hash)
            # found = true
            # break
          end
        end
        # if found
        #   #puts "sym adjacent 3"
        #   sum += num
        #   next
        # end
      end
    end
    j += 1
  end
end
#puts "hash #{sym_hash}"
sum = 0
# iterate over sym_hash
sym_hash.each_value do |a|
  if a.length == 2
    sum += a[0]*a[1]
  end
end
puts sum