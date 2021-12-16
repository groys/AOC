def dliteral
  bin = ""
  while true
    bin << $b[($i + 1)...($i + 5)]
    if $b[$i] == "0"
      break
    end
    $i += 5
  end
  $i += 5
  bin.to_i(2)
end

def decode
  while $i < $b.length
    if $b[$i...$b.length].to_i(2) == 0
      break
    end
    v = $b[$i...($i + 3)]
    $i = $i + 3
    v = v.to_i(2)
    $vs += v
    pid = $b[$i...($i + 3)].to_i(2)
    $i = $i + 3
    # puts "pid = #{pid}"
    if pid == 4
      val = dliteral
      # puts "#{val}"
      return val
    else
      literals = []
      lti = $b[$i]
      $i += 1
      if lti == "0"
        tlib = $b[$i...($i + 15)].to_i(2)
        $i += 15
        bef = $i
        while $i - bef < tlib
          literals << decode
        end
      else
        nsub = $b[$i...($i + 11)].to_i(2)
        $i += 11
        c = 0
        while c < nsub
          literals << decode
          c += 1
        end
      end
      # puts "literals = #{literals}"
      case pid
      when 0
        return literals.sum
      when 1
        return literals.reduce(:*)
      when 2
        return literals.min
      when 3
        return literals.max
      when 5
        return literals[0] > literals[1] ? 1 : 0
      when 6
        return literals[0] < literals[1] ? 1 : 0
      when 7
        return literals[0] == literals[1] ? 1 : 0
      end
    end
  end
end

m = { "0" => "0000",
      "1" => "0001",
      "2" => "0010",
      "3" => "0011",
      "4" => "0100",
      "5" => "0101",
      "6" => "0110",
      "7" => "0111",
      "8" => "1000",
      "9" => "1001",
      "A" => "1010",
      "B" => "1011",
      "C" => "1100",
      "D" => "1101",
      "E" => "1110",
      "F" => "1111" }
l = gets.strip!
$b = ""
l.each_char { |c| $b << m[c] }

$i = 0
$vs = 0
puts "b = #{$b}"
puts "length = #{$b.length}"
puts "#{decode}"
puts $vs

