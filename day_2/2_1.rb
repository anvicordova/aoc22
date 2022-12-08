codes_to_shapes = {
  "A" => :rock,
  "B" => :paper,
  "C" => :scissors,
  "X" => :rock,
  "Y" => :paper,
  "Z" => :scissors
}

code_score = {
  "X" => 1,
  "Y" => 2,
  "Z" => 3
}

total_score = 0

def calculate_score(p1:, p2:)
  case p2
  when :rock
    return 0 if p1 == :paper
    return 3 if p1 == :rock
    return 6 if p1 == :scissors
  when :paper
    return 0 if p1 == :scissors
    return 3 if p1 == :paper
    return 6 if p1 == :rock
  when :scissors
    return 0 if p1 == :rock
    return 3 if p1 == :scissors
    return 6 if p1 == :paper
  end
end


File.foreach("input") do |line|
  plays = line.split(" ")
  p1 = codes_to_shapes[plays.first]
  p2 = codes_to_shapes[plays.last]
  
  round_score = code_score[plays.last] + calculate_score(p1: p1 , p2: p2)
  total_score += round_score
  round_score = 0
end

puts total_score
