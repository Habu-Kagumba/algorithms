require_relative './node'

class LinkedList
  attr_reader :length
  alias size length

  def initialize
    @head = @tail = nil
    @length = 0
  end

  def first
    @head && @head.data
  end

  def last
    @tail && @tail.data
  end

  def push(node)
    node = Node.new(node)
    @head ||= node

    if @tail
      @tail.next = node
      node.prev = @tail
    end

    @tail = node
    @length += 1

    self
  end
  alias << push

  def unshift(node)
    node = Node.new(node)
    @tail ||= node

    node.next = @head
    @head.prev = node
    @head = node

    @length += 1

    self
  end

  def pop
    return nil unless @head

    tmp = @tail
    @tail = @tail.prev
    @tail.prev.next = nil
    tail = tmp

    @head = nil unless @tail
    @length -= 1

    tail.data
  end

  def shift
    return nil unless @head

    tmp = @head
    @head = @head.next
    tmp.next = nil
    head = tmp

    @tail = nil unless @head
    @length -= 1

    head.data
  end
end
