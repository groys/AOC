require 'bigdecimal'


# Solve the quadratic inequality how many positive integer values of a satisfy the inequality a^2 - a*t + d < 0

t = gets.split(":")[1].split().join("").to_i
d = gets.split(":")[1].split().join("").to_i

a1 = (BigDecimal(t.to_s) + BigDecimal(Math.sqrt(t**2 - 4*d).to_s)) / 2
a2 = (BigDecimal(t.to_s) - BigDecimal(Math.sqrt(t**2 - 4*d).to_s)) / 2

a_min = [a1, a2].min.ceil
a_max = [a1, a2].max.floor

distinct_integers_a = a_max - a_min + 1

puts distinct_integers_a

