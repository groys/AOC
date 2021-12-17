l = gets.strip!
xr, yr = l.split(" ").map { |p| p.split("=")[1] }.map { |r| r.split("..") }

# roots of x2+x -2X1
ax = 1
bx = 1
cx1 = -2 * xr[0].to_i
cx2 = -2 * xr[1].to_i

rx = []
rx << (-bx + Math.sqrt(bx * bx - 4 * ax * cx1)) / 2 * ax
rx << (-bx - Math.sqrt(bx * bx - 4 * ax * cx1)) / 2 * ax
rx << (-bx + Math.sqrt(bx * bx - 4 * ax * cx2)) / 2 * ax
rx << (-bx - Math.sqrt(bx * bx - 4 * ax * cx2)) / 2 * ax
rx.select! { |r| r > 0 }.sort!
rx[0] = rx[0].ceil
rx[1] = rx[1].floor
# puts rx

ay = 1
by = 1
x = -1
rx[1].downto(rx[0]).each { |i|
  ci = i * (i + 1) / 2
  cy1 = ci + 2 * yr[0].to_i
  cy2 = ci + 2 * yr[1].to_i
  ry = []
  yy1 = by * by - 4 * ay * cy1
  if yy1 > 0
    ry << (-by + Math.sqrt(yy1)) / 2 * ay
    ry << (-by - Math.sqrt(yy1)) / 2 * ay
  end
  yy2 = by * by - 4 * ay * cy2
  if yy2 > 0
  ry << (-by + Math.sqrt(yy2)) / 2 * ay
  ry << (-by - Math.sqrt(yy2)) / 2 * ay
  end
  ry.select! { |r| r > 0 }
  if !ry.empty?
    puts i * (i + 1) / 2
    #puts "#{ry}"
    break
  end
}