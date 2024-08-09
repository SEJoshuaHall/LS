require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require 'simplecov'
SimpleCov.start

require_relative 'todolist'
class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.count, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(2, @list.size)  
  end

  def test_pop
    @list.pop
    assert_equal(2, @list.size)  
    assert_equal(@todo2, @list.last)
  end

  def test_done_question
    assert_equal(false, @list.done?)
  end

  def test_add_item_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hi') }
  end

  def test_shovel_method
    new_todo = Todo.new("Walk the dog")
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add_method_alias
    new_todo = Todo.new("Feed the dog")
    @list.add(new_todo)
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(@list.size) }
    assert_equal(@list.item_at(-1), @list.last)
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(@list.size) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(@list.size) }
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(@list.size) }
    @list.remove_at(1)
    assert_equal(@todo1, @list.first)
    assert_equal(@todo3, @list.last)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    
    @todo1.done!
    assert_equal(output, @list.to_s)

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    
    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    @list.each { |todo| todo.done! }
    assert_equal(@todos, @list.to_a)
    assert_equal(@list, @list.each { |_| _ })
  end

  def test_select
    list2 = @list.select { |todo| todo.title == "Buy milk" }
    assert_equal(list2.first.title, "Buy milk")
    refute_same(@list, list2)
  end
end