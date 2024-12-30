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

  def size
    
  end

  def empty?
    
  end

  def push(arg)
    
  end

  def peek
    
  end

  def head
    
  end

  def pop
    
  end

  def self.from_a(array)
    
  end

  def to_a
    
  end

  def reverse
  
  end
end

