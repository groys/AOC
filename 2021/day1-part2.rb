$stdout.sync = true
a = []
while ns = gets
  a << ns.to_i
end
s = a.size
ans = 0
i = 0
(s-3).times do
  if a[i+3] > a[i]
    ans += 1
  end
  i +=1
end
puts ans
