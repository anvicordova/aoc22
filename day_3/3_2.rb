require 'set'

total = 0

def priority(number)
  number <= 90 ? number - 38 : number - 96
end

lines = []

File.foreach("input") do |line|
  lines << line

  if lines.size == 3
    set_1 = Set.new(lines[0].chars)
    set_2 = Set.new(lines[1].chars)
    set_3 = Set.new(lines[2].chars)

    char = set_1.intersection(set_2).intersection(set_3).first
    total += priority(char.ord)

    lines = []
  end
end

puts total