require 'set'
$stdout.sync = true
MapEntry = Struct.new(:dest, :src, :range)

def read_map(arr)
  gets #skip map name
  while line = gets
    a = line.split().map(&:to_i)
    if a.empty?
      break
    end
    arr << MapEntry.new(a[0], a[1], a[2])
  end
end

# convert from src to destination
def convert(arr, srcval)
  arr.each do |mapEntry|
    #puts "srcval = #{srcval} src = #{mapEntry.src} range = #{mapEntry.range}"
    if srcval >= mapEntry.src && srcval <= mapEntry.src + mapEntry.range
      #puts "found"
      return mapEntry.dest + (srcval - mapEntry.src)
    end
  end
  srcval
end

def part1(fertToWater, humidityToLocation, lightToTemp, seedToSoil, seeds, soilToFert, tempToHumidity, waterToLight)
  min = seeds.max * 10000
  seeds.each { |seed|
    # puts "seed #{seed}"
    soil = convert(seedToSoil, seed)
    # puts "soil #{soil}"
    fert = convert(soilToFert, soil)
    # puts "fert #{fert}"
    water = convert(fertToWater, fert)
    # puts "water #{water}"
    light = convert(waterToLight, water)
    # puts "light #{light}"
    temp = convert(lightToTemp, light)
    # puts "temp #{temp}"
    humidity = convert(tempToHumidity, temp)
    # puts "humidity #{humidity}"
    location = convert(humidityToLocation, humidity)
    # puts "location #{location}"

    if location < min
      min = location
    end
  }
  min
end

# idea
# Scanning entire range of seeds is too time consuming
# Split each range into intervals of length sqrt(range). See which interval boundary leads to minimum
def part2(fertToWater, humidityToLocation, lightToTemp, seedToSoil, seeds, soilToFert, tempToHumidity, waterToLight)
  min = seeds.max * 10000
  i = 0
  while i < seeds.length do
    st = seeds[i]
    inc = Math.sqrt(seeds[i + 1])
    inc = inc.round
    puts "inc = #{inc}"
    j = 0
    minj = -1
    while j < inc + 1
      if j == inc
        seed = st + seeds[i + 1] - 1
      else
        seed = st + j * inc
      end

      soil = convert(seedToSoil, seed)
      fert = convert(soilToFert, soil)
      water = convert(fertToWater, fert)
      light = convert(waterToLight, water)
      temp = convert(lightToTemp, light)
      humidity = convert(tempToHumidity, temp)
      location = convert(humidityToLocation, humidity)
      if location < min
        min = location
        minj = j
        puts "min = #{min} minj = #{minj}"
      end
      j += 1
    end
    # manually search the interval around minj-1 to minj+1
    if minj != -1
      ((st + (minj - 1) * inc)...(st + (minj + 1) * inc)).each do |k|
        seed = k
        if seed < st || seed > st + seeds[i + 1]
          # puts "zero"
          next
        end
        soil = convert(seedToSoil, seed)
        fert = convert(soilToFert, soil)
        water = convert(fertToWater, fert)
        light = convert(waterToLight, water)
        temp = convert(lightToTemp, light)
        humidity = convert(tempToHumidity, temp)
        location = convert(humidityToLocation, humidity)
        if location < min
          min = location
          puts "min = #{min} humidity = #{humidity}"
        end
      end
    end

    i += 2
    puts "i = #{i}"
  end
  min
end

# read seeds
seeds = gets.split(":")[1].split().map(&:to_i)
puts "seed = #{seeds}"
# skip line
gets
# read seed to soil
seedToSoil = []
read_map(seedToSoil)
soilToFert = []
read_map(soilToFert)

fertToWater = []
read_map(fertToWater)

waterToLight = []
read_map(waterToLight)

lightToTemp = []
read_map(lightToTemp)

tempToHumidity = []
read_map(tempToHumidity)

humidityToLocation = []
read_map(humidityToLocation)

min = part1(fertToWater, humidityToLocation, lightToTemp, seedToSoil, seeds, soilToFert, tempToHumidity, waterToLight)
puts "Part1 #{min}"
min = part2(fertToWater, humidityToLocation, lightToTemp, seedToSoil, seeds, soilToFert, tempToHumidity, waterToLight)
puts "Part2 #{min}"







