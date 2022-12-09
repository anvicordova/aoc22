
def process_line(line)
  (0..line.size - 14).each do |i|
    if line[i...i+14].chars.uniq.count == 14
      puts i+14 
      return
    end
  end
end

File.foreach("input") do |line|
  process_line(line)
end