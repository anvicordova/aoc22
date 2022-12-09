stacks = []

File.foreach("input.txt") do |line|
  if line.include?("[")
    letters = line.scan(/[A-Z]/)
    positions = line.gsub(/\[/).map { Regexp.last_match.begin(0) }

    positions.each_with_index do |position, index|
      real_position = position / 4

      stacks[real_position].nil? ? stacks[real_position] = [letters[index]] : stacks[real_position] << letters[index]
    end
  end

  if line.include?("move")
    moves = line.scan(/\d+/).map(&:to_i)
    quantity = moves[0]
    from =  moves[1] - 1
    to = moves[2] - 1

    crates = stacks[from].shift(quantity)
    crates.reverse_each { |crate| stacks[to].unshift(crate) }
  end
end

puts stacks.map(&:first).join