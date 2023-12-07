$stdout.sync = true
# type 0...6 high card ... five of kind

$CVAL = {'A'=>14, 'K'=>13, 'Q'=> 12, 'J'=>1, 'T'=>10, '9'=>9, '8'=>8, '7'=>7, '6'=>6, '5'=>5, '4'=>4, '3'=>3, '2'=>2}
Hand = Struct.new(:cards,  :bid, :type)

def compareHandStrings(s1, s2)
  i = 0
  while i < 5
    if $CVAL[s1[i]] == $CVAL[s2[i]]
      i += 1
      next
    end
    return $CVAL[s1[i]] <=> $CVAL[s2[i]]
  end
end


def handType(hand)
  c = hand.cards
  map = {}
  c.each_char do |ch|
    if map[ch].nil?
      map[ch] = 1
    else
      map[ch] = map[ch] + 1
    end
  end
  puts "map = #{map}"
  setType(hand, map)
  # For part 2
  if map.has_key?('J')
    case hand.type
    when 0
      hand.type = 1
    when 1
      hand.type = 3
    when 2
      if map['J'] == 1
        hand.type = 4
      else
        hand.type = 5
      end
    when 3
      hand.type = 5
    when 4
      hand.type = 6
    when 5
      hand.type = 6
    else
      hand.type = 6
    end
  end
end

def setType(hand, map)
  if map.length == 1
    hand.type = 6
    return
  end
  max = map.values.max
  min = map.values.min
  if max == 4
    hand.type = 5
    return
  end
  if max == 3
    if min == 2
      hand.type = 4
      return
    else
      hand.type = 3
      return
    end
  end
  if max == 2
    if map.values.length == 3
      hand.type = 2
      return
    else
      hand.type = 1
      return
    end
  end
  hand.type = 0
end


hands = []
while (line = gets)
  a = line.split
  h = Hand.new(a[0], a[1].to_i)
  handType(h)
  hands << h
end
puts "hands #{hands}"

hands.sort!{|a, b|
  if a.type == b.type
    compareHandStrings(a.cards, b.cards)
  else
    a.type <=> b.type
  end
}
puts "hands #{hands}"
ret = 0
i = 1
hands.each do |hand|
  ret += hand.bid*i
  i += 1
end
puts ret
