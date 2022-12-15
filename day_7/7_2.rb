class File
  attr_reader :name, :size

  def initialize(name:, size:)
    @name = name
    @size = size
  end
end

class Directory
  attr_reader :name, :directories, :files, :parent_directory

  def initialize(name:, parent_directory:)
    @name = name
    @directories = {}
    @files = []
    @parent_directory = parent_directory
  end

  def add_directory(directory:)
    directories[directory.name] = directory
  end

  def add_file(file:)
    @files << file
  end

  def size
    total = files.map(&:size).sum
    total += directories.values.map(&:size).sum
    total
  end

  def <=>(b)
    return 0 if size == b.size
    return -1 if size < b.size
    return 1 if size > b.size
  end
end

first_directory = Directory.new(name: "/", parent_directory: nil)
current_directory = nil
last_command = nil
all_dirs = [first_directory]

File.foreach("input") do |line|
  parts = line.split(" ")

  last_command = line if parts.include?("$")

  if last_command.include?("ls")
    if parts.include?("dir")
      dir = Directory.new(name: parts.last, parent_directory: current_directory)
      all_dirs << dir
      current_directory.add_directory(directory: dir)
    else
      file = File.new(name: parts.last, size: parts.first.to_i)
      current_directory.add_file(file: file)
    end
  elsif last_command.include?("cd")
    if last_command.include?("/")
      current_directory = first_directory
    elsif last_command.include?("..")
      current_directory = current_directory.parent_directory
    else
      current_directory = current_directory.directories[parts.last]
    end
  end
end

current_space = first_directory.size
available = 70000000 - current_space

list = all_dirs.sort!.select do |dir| available + dir.size >= 30000000 end
puts list.map(&:size).first

