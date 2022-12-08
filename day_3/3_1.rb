require 'set'

total = 0

def priority(number)
  number <= 90 ? number - 38 : number - 96
end

File.foreach("input") do |line|
  a1 = line[0...(line.size/2)].chars
  a2 = line[(line.size/2)..].chars

  char = Set.new(a1).intersection(Set.new(a2)).first
  total += priority(char.ord)
end

puts total