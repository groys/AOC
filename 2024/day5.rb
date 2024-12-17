$stdout.sync = true

rows = []
m = Array.new(100) { Array.new(100, 0) }

def valid (m, i, j)
  m[i][j] == 1
end

while (line = gets)
  if line.include? "|"
    nums = line.split("|").map(&:to_i)
    m[nums[0]][nums[1]] = 1
    m[nums[1]][nums[0]] = -1
  else
    if line.include?(",")
      nums = line.split(",").map(&:to_i)
      rows << nums
    end
  end
end

resv = 0
resnv = 0
rows.each_with_index do |row, ind|
  # is row valid?
  # iterate from elem + 1 to end of row
  # puts "Row #{ind} is #{row}"
  valid = true
  for i in 0..row.length - 2
    for j in (i + 1)..row.length - 1
      unless valid(m, row[i], row[j])
        valid = false
        break
      end
      unless valid
        break
      end
    end
  end
  if valid
    var = row[row.length / 2]
    # puts "Row #{ind} is valid. Adding #{var}"
    resv += var
  else
    # row is not valid
    # sort row using the comparator function i, j -> m[i][j]
    row.sort! { |i, j| m[i][j] }
    resnv += row[row.length/2]
  end
end
puts resv
puts resnv