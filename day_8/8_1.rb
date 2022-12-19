class Tree
  attr_accessor :size, :right_trees, :left_trees, :top_trees, :bottom_trees, :edge

  def initialize(size:, edge: false)
    @size = size
    @edge = edge
  end

  def edge?
    edge
  end

  def visible_right?
    size > right_trees.max
  end

  def visible_left?
    size > left_trees.max
  end

  def visible_top?
    size > top_trees.max
  end

  def visible_bottom?
    size > bottom_trees.max
  end

  def visible?
    edge || (!edge && (visible_right? || visible_left? || visible_bottom? || visible_top?))
  end
end


matrix = []
file= File.open("input","r")
size = file.readlines.size - 1

File.foreach("input").with_index do |line, row_index|
  column = line.strip.split("").map(&:to_i)
  col_size = column.size - 1

  cell_row = []

  column.each.with_index do |value, col_index|
    edge = false
    edge = true if row_index == 0 || row_index == size || col_index == 0 || col_index == col_size


    cell = Tree.new(size: value, edge: edge)
    cell_row << cell
  end

  matrix << cell_row
end


matrix_col_size = matrix.first.size
matrix_row_size = matrix.size

total = 0

matrix_row_size.times do |i|
  matrix_col_size.times do |j|
    cell = matrix[i][j]

    left = matrix[i][...j].map(&:size)
    right = matrix[i][j+1..].map(&:size)
    top = matrix[...i].map { |a| a[j] }.map(&:size)
    bottom = matrix[i+1...].map { |a| a[j] }.map(&:size)

    cell.left_trees =  left
    cell.right_trees = right
    cell.top_trees = top
    cell.bottom_trees =  bottom

    total += 1 if cell.visible?
  end
end

puts total