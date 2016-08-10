class KnightPathFinder

  attr_reader :start
  #attr_accessor :visited_positions
  attr_accessor :parent, :children, :visited_positions

  DELTAS = [
    [-2, -1],
    [-1, -2],
    [2, -1],
    [1, -2],
    [-2, 1],
    [-1, 2],
    [2, 1],
    [1, 2]
  ]

  def initialize (start)
    @start = start
    @visited_positions = [@start]
    @parent = nil
    @children = new_move_positions(@start) #KnightPathFinder.valid_moves(@start)
    #@path = [@start]
  end

  def self.valid_moves(pos)
    adjacent_coords = DELTAS.map {|(dx, dy)| [pos[0] + dx, pos[1] + dy]}
    adjacent_coords.select do |row, col|
      row.between?(0, 7) && col.between?(0, 7)
    end
  end

  def new_move_positions(pos)
    new_moves = KnightPathFinder.valid_moves(pos).select {|move| !@visited_positions.include?(move)}
    @visited_positions += new_moves
    new_moves
  end

  def build_move_tree
    #nodes = []
    @children.each do |child|
      node = KnightPathFinder.new(child)
      node.parent = self
      node.build_move_tree
      #node.visited_positions += [self] #self.visited_positions
      #nodes << node
    end
    #p nodes
    #nodes.each do |child_node|
    #  child_node.build_move_tree
    #end
  end
=begin

  def build_move_tree(*end_pos)
    queue = [self]
    until queue.empty?
      current = queue.shift
      return current.path if current.start == end_pos[0]

      new_move_positions(current.start).each do |move|
        next_node = KnightPathFinder.new(move)
        next_node.path += current.path
        queue << next_node
      end
    end
  end

  def find_path(end_pos)
    build_move_tree(end_pos).reverse
  end
=end
end

tester = KnightPathFinder.new([0,0])
tester.build_move_tree
p tester
