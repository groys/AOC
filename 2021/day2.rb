
$stdout.sync = true
h = 0
d = 0
a = 0
while line = gets
  arr = line.split
  if arr[0] == "forward"
    val = arr[1].to_i
    h += val
    d += (val*a)
  end
  if arr[0] == "down"
    a += arr[1].to_i
  end
  if arr[0] == "up"
    a -= arr[1].to_i
  end
end
puts h*d