# frozen_string_literal: true

# Creates elements for the linked lists.
class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

# Linked list objects to hold elements.
class SimpleLinkedList
  attr_reader :head

  def size
    counter = 0
    return 0 if @head.nil?

    counter += 1
    current = head
    until current.next.nil?
      counter += 1
      current = current.next
    end

    counter
  end

  def empty?
    @head.nil?
  end

  def push(arg)
    @head = if head.nil?
              Element.new(arg)
            else
              Element.new(arg, @head)
            end
  end

  def peek
    @head&.datum
  end

  def pop
    result = @head
    @head = @head.next
    result.datum
  end

  def self.from_a(array)
    if [nil, []].include?(array)
      SimpleLinkedList.new
    else
      list = SimpleLinkedList.new
      array.reverse.each { |datum| list.push(datum) }
      list
    end
  end

  def to_a
    result = []
    head = @head
    until head.nil?
      result << head.datum
      head = head.next
    end
    result
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end
end
