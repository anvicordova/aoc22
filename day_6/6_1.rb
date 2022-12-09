
def process_line(line)
  (0..line.size - 4).each do |i|
    if line[i...i+4].chars.uniq.count == 4
      puts i+4 
      return
    end
  end
end

File.foreach("input") do |line|
  process_line(line)
end