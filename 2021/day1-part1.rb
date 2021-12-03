$stdout.sync = true
p = 1000000000
a = 0
while ns = gets
  n = ns.to_i
  if n > p
    a += 1
  end
  p = n
end
puts a
