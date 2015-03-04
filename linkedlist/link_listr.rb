class LinkedList

  attr_reader :head

end

class Node
  attr_reader :next_node
  attr_accessor :data

  def initialize(data, link)
    @link = link
    @data = data
  end

  def next_node
    next_node = next_node + 1
  end

  def data
    @data
  end
  # A single node for either list type
end
