class PolyTreeNode
  attr_accessor :children
  attr_reader :value, :parent

  def initialize(value, parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end

  def parent=(value)
    if @parent
      @parent.children.delete(self)
    end
    @parent = value
    value.children << self unless value.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise if !@children.include?(child_node)
    @children.delete(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if @value == target_value
    @children.each do |child|
      target = child.dfs(target_value)
      return target if target
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current = queue.shift
      return current if current.value == target_value
      @children.each{|c| queue << c }
    end
    nil
  end

end
