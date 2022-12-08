buffer = []
total = 0
max = 0

File.foreach("input") do |line|

    if !line.chomp.empty?
      number = line.to_i
      total += number
    else
      max = total > max ? total: max
      total = 0
    end
end

puts max