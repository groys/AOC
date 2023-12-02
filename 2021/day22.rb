a = Array.new(101) { Array.new(101) { Array.new(101, 0) } }
while l = gets
  l.strip!
  o, r = l.split
  puts "o = #{o} r = #{r}"
  co = r.split(",").map { |rr| rr.split("=").select { |rrr| rrr[1] } }.map { |x| x[0].split("..").map { |y|
    y.to_i }
  }
  # co = r.split(",").map { |rr|
  #   puts "rr = #{rr}"
  #   rr.split("=").select { |rrr|
  #     puts "rrr = #{rrr[1]}"
  #     rrr[1]
  #   }.map { |x|
  #     x[0].split("..").map { |y|
  #       puts "y = #{y}"
  #       y = y.to_i
  #       # if y < -50
  #       #   y = -50
  #       # end
  #       # if y > 50
  #       #   y = 50
  #       # end
  #       # y
  #     }
  #   }
  # }
  puts "co = #{co}"
  for i in co[0][0]..co[0][1]
    if i < -50 || i > 50
      next
    end

    for j in co[1][0]..co[1][1]
      if j < -50 || j > 50
        next
      end
      for k in co[2][0]..co[2][1]
        if k < -50 || k > 50
          next
        end
        if o == "on"
          a[i + 50][j + 50][k + 50] = 1
        else
          a[i + 50][j + 50][k + 50] = 0
        end
      end
    end
  end
end
c = 0
for i in 0..100
  for j in 0..100
    for k in 0..100
      c += a[i][j][k]
    end
  end
end
puts c


