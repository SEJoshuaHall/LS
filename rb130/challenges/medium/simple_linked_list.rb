# Creates elements for the linked lists.
class Element
  attr_reader :datum, :next

  def initialize(datum, next_element=nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next == nil
  end
end

# Linked list objects to hold elements.
class SimpleLinkedList
  attr_reader :head

  def initialize
    @list = []
  end

  def size
    @list.count
  end

  def empty?
    @list.empty?
  end

  def push(arg)
    @list << Element.new(arg, head)
  end

  def peek
    return nil if @list.empty?
    @list[-1].datum
  end

  def head
    return nil if empty?
    @list[-1]
  end

  def pop
    return nil if empty?
    @list.pop.datum
  end

  def self.from_a(array)
    class_list = SimpleLinkedList.new
    unless array == nil
      array.each_with_index do |e, i|
        class_list.list << (Element.new(e, (class_list.list.size > 1 ? class_list.list[-1] : nil)))
      end
    end
    class_list
  end

  def to_a
    @list.map { |element| element.datum }
  end

  def reverse
    @list.reverse
    @list.each_with_index do |e, i|
      if i == @list.count - 1
        e.next = nil
      else
        e.next = @list[i + 1]
      end
    end
  end
end

