# BFS
# keep track of small visited
# if you hit end
#
# rep graph
# h = map <node, list<node>>
require 'set'

def small(n)
  n == n.downcase
end

def visit(n)
  if n == "end"
    #puts "$v = #{$v}"
    $path << "end"
    val = $paths.add?($path.clone)
    if val.nil?
      puts "dup"
    end
    $path.delete("end")
    return
  end
  if small(n)
    if $v.keys.include?(n)
      unless n == $twice && $v[n] == 1
        return
      end
    end
    if n == $twice
      if $v[n].nil?
        $v[n] = 1
      else
        $v[n] = 2
      end
    else
      $v[n] = 1
    end
  end
  $path << n
  # puts "v = #{$v}"
  # puts "pat = #{$path}"
  unless $h[n].nil?
    # puts "n = #{n} adj = #{$h[n]}"
    $h[n].each { |ne|
      visit(ne)
    }
  end
  if n == $twice
    if $v[n] == 2
      $v[n] = 1
    else
      $v.delete(n)
    end
  else
    $v.delete(n)
  end
  $path.pop
  # puts "v = #{$v}"
end

$h = {}
while l = gets
  a, b = l.strip!.split("-")
  if $h[a].nil?
    $h[a] = []
  end
  $h[a] << b
  if $h[b].nil?
    $h[b] = []
  end
  $h[b] << a
end

puts "#{$h}"
$smalls = $h.keys.filter{|k| k.downcase == k && k != "start" && k != "end"}
puts "#{$smalls}"
$paths = Set.new
$path = []
$smalls.each do |s|
  $twice = s
  $v = {}
  visit("start")
end
# $paths.each do |p|
#   puts "#{p}"
# end
puts "#{$paths.size}"



