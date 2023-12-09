$stdout.sync = true

def part1_compute(seqs)
  val = 0
  j = seqs.length - 1
  while j >= 0
    val = seqs[j][seqs[j].length - 1] + val
    j -= 1
  end
  # puts "val = #{val}"
  val
end

def part2_compute(seqs)
  val = 0
  j = seqs.length - 1
  while j >= 0
    val = seqs[j][0] - val
    j -= 1
  end
  # puts "val = #{val}"
  val
end

inputs = []
ret1 = 0
ret2 = 0

while line = gets
  input = line.split.map(&:to_i)
  inputs << input
  seqs = [input]
  i = 1
  while true
    diff = []
    j = 0
    while j < seqs[i - 1].length - 1
      diff << seqs[i - 1][j + 1] - seqs[i - 1][j]
      j += 1
    end
    seqs << diff
    i += 1
    if diff.max == diff.min
      break
    end
  end
  ret1 += part1_compute(seqs)
  ret2 += part2_compute(seqs)

end
puts "part1 #{ret1}"
puts "part2 #{ret2}"
