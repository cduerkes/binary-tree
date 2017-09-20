class BinaryTreeNode
  attr_accessor :payload, :left, :right

  def initialize(payload, left=nil, right=nil)
    @payload = payload
    @left = left
    @right = right
  end

  def print_values
    print "#{self.payload} --> "
    if self.left
      self.left.print_values
    else
      print "nil (#{self.payload} left)\n"
    end
    if self.right
      self.right.print_values
    else
      print "nil (#{self.payload} right)\n"
    end
  end

  def step_down(payload)
    if payload < self.payload
      if self.left 
        self.left.step_down(payload)
      else 
        self.insert_left(payload)
      end
    end

    if payload > self.payload
      if self.right 
        self.right.step_down(payload)
      else 
        self.insert_right(payload)
      end
    end
  end

  def insert_left(payload)
    @left = BinaryTreeNode.new(payload)
    p "left: "
    p @left
    return @left
  end

  def insert_right(payload)
    @right = BinaryTreeNode.new(payload)
    p "right: "
    p @right
    return @right
  end
end

class BTreeSort

  def initialize
    @treesort = []
  end

  def build_tree(array)

    trunk = BinaryTreeNode.new(array[0])

    rest = array.drop(1)
    rest.each do |payload|
      trunk.step_down(payload)
    end

    return trunk
  end

  def self.sort(array)
    build_tree(array)
  end

end

array = [7, 4, 9, 1, 6, 14, 10]
sort1 = BTreeSort.new
tree = sort1.build_tree(array)
tree.print_values
=begin
ten = BinaryTree.new(10)
fourteen = BinaryTree.new(14)
six = BinaryTree.new(6)
one = BinaryTree.new(1)
nine = BinaryTree.new(9)
four = BinaryTree.new(4)
seven = BinaryTree.new(7)
=end