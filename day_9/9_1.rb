matrix = [["#"]]
head_x_position = 0
head_y_position = 0
tail_x_position = 0
tail_y_position = 0


def show_matrix(matrix)
  #puts matrix.inspect
  matrix.each.with_index do |row, i|
    # row.each.with_index do |column, j|
    #   p matrix[i][j]
    # end
    puts row.inspect
    #puts "\n"
  end
end

File.foreach("input_test") do |line|
  puts line
  direction, moves = line.split(" ")
  moves = moves.to_i

  moves.times do |i|
    if direction == "R"
      head_y_position += 1
      matrix[head_x_position][head_y_position] = 'H'
    elsif direction == "L"
      head_y_position -= 1
      if head_y_position < 0
        matrix[head_x_position].unshift("H")
        head_y_position = 0
      else
        matrix[head_x_position][head_y_position] = 'H'
      end
    elsif direction == "U"
      head_x_position -= 1
      matrix.unshift([]) if head_x_position < 0
      head_x_position = 0
      matrix[head_x_position][head_y_position] = 'H'
    elsif direction == "D"
      head_x_position += 1
      matrix.shift([]) if head_x_position >= matrix.size
      matrix[head_x_position][head_y_position] = 'H'
    end
  end
end

matrix.each do |row| puts row.inspect end