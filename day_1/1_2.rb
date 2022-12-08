buffer = []
total = 0
results = []

File.foreach("input") do |line|

    if !line.chomp.empty?
      number = line.to_i
      total += number
    else
      results << total
      results = results.max(3)
      total = 0
    end
end

puts results.sum
