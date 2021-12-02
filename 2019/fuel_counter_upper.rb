def get_fuel mod
  s = 0
  while (mod/3 - 2) > 0
    mod = mod/3 - 2
    s += mod

  end
  s
end

$stdout.sync = true
sum = 0
while mods=gets
  mod = mods.to_i
  sum += get_fuel mod
end
puts sum