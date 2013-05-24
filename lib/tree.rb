class TreeNode
  attr_accessor :parent, :children
  attr_reader :value

  def initialize(value)
    @value = value
    @children = []
  end

  def parent
    @parent
  end

  def set_child(node)
    @children << node
    node.parent = self
  end

  def dfs(target)
    if self.value == target
      return self
    else
      @children.each do |child|
        result = child.dfs(target)
        return result if result
      end

    end
    nil
  end

  def bfs(target)
    queu = [self]
    until queu.empty?
      check = queu.shift
      if check.value == target
        return check
      else
        next if check.children.empty?
        queu += check.children
      end
    end
    nil
  end

end
