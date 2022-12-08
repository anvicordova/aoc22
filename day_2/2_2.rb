codes_to_shapes = {
  "A" => :rock,
  "B" => :paper,
  "C" => :scissors,
  "X" => :rock,
  "Y" => :paper,
  "Z" => :scissors
}

result = {
  "X" => 0,  # lose
  "Y" => 3,  # draw
  "Z" => 6  # win
}

def calculate_move_score(p1:, round_result:)
  code_score = {
    rock:  1,
    paper: 2,
    scissors: 3
  }

  case p1
  when :rock
    return code_score[:scissors] if round_result == 0
    return code_score[:rock] if round_result == 3
    return code_score[:paper] if round_result == 6
  when :paper
    return code_score[:rock] if round_result == 0
    return code_score[:paper] if round_result == 3
    return code_score[:scissors] if round_result == 6
  when :scissors
    return code_score[:paper] if round_result == 0
    return code_score[:scissors] if round_result == 3
    return code_score[:rock] if round_result == 6
  end
end


total_score = 0

File.foreach("input") do |line|
  plays = line.split(" ")
  p1 = codes_to_shapes[plays.first]
  round_result = result[plays.last]

  round_score = round_result + calculate_move_score(p1: p1 , round_result: round_result)
  total_score += round_score
  round_score = 0
end

puts total_score
