require 'set'

total = 0


lines = []

File.foreach("input") do |line|
  elfs = line.chomp.split(",")
  e1 = elfs[0].split("-").map(&:to_i)
  e2 = elfs[1].split("-").map(&:to_i)


  if (e2[0]..e2[1]).include?(e1[0]) || (e2[0]..e2[1]).include?(e1[1])
    total += 1
  elsif (e1[0]..e1[1]).include?(e2[0]) || (e1[0]..e1[1]).include?(e2[1])
    total += 1
  end
end

puts total