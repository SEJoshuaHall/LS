
class Element
  attr_reader :datum, :next

  def initialize(datum, next_datum=nil)
    @datum = datum
    @next = next_datum
  end

  def tail?
    self.next == nil
  end
end


class SimpleLinkedList
  attr_reader :list

  def initialize
    @list = []
  end

  def size
    @list.count
  end

  def empty?
    @list.count == 0
  end

  def push(datum)
    @list << Element.new(datum, @list.last)
  end

  def peek
    
  end

  def head

  end

  def next

  end

  def pop

  end

  def to_a

  end

  def reverse

  end

  def self.from_a(array) #create complete list from array

  end
  
end