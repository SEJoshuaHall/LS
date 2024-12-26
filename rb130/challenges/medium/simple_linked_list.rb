=begin
PROBLEM
Create a linked list, each element contains data, and next
elements must allow for a variety of data types
methods for reversing and converting to and from an array

Questions
Is the list a custom object, or contains custom list objects or both?

EXAMPLES
We see that we need two classes, Element and SimpleLinkedList

Element
Elements require a data argument and an optional next datum argument
Need a getter for Data
Tail test (next is nil)
next method to return next element

SimpleLinkedList
class method to create new from array
class method to create array from list
add to list
remove head
return head
size
empty
head data
return reverse list

DATA
elements store any type of data, and the next element

ALGORITHM


=end

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