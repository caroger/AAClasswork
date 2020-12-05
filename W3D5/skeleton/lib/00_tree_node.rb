class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(p_node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = p_node
    @parent.nil? ? return : @parent.children << self
  end

  def add_child(c_node)
    c_node.parent = (self)
  end

  def remove_child(c_node)
    raise 'not a child' unless @children.include?(c_node)

    c_node.parent = (nil)
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      first = queue.shift
      return first if first.value == target

      queue += first.children
    end
    nil
  end

  def dfs(target)
    return self if value == target
    return nil if nil?

    children.each do |child|
      r = child.dfs(target)
      return r unless r.nil?
    end
    nil
  end
end
