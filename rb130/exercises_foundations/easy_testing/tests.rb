require 'minitest/autorun'

class Person
  attr_reader :value

  def initialize(name, age)
    @name = name
    @age = age
    @value = 31
  end
end

class NoExperienceError < StandardError; end

class Employee
  def initialize(years_experience)
    @years_experience = years_experience
  end

  def hire
    if @years_experience == 0
      raise NoExperienceError
    end
  end
end

class List
  def process
    self
  end
end

class PersonTest < Minitest::Test
  def setup
    @joshua = Person.new('Joshua', 38)
  end

  def test_boolean
    assert_equal(true, @joshua.value.odd?)
  end

  def test_equality
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end

  def test_nil
    value = nil
    assert_nil(nil, value)
  end

  def test_empty_object
    list = []
    assert_empty(list)
  end

  def test_include_object
    list = ['xyz']
    assert_includes(list, 'xyz')
  end

  def test_exception
    employee = Employee.new(0)

    assert_raises NoExperienceError do
      employee.hire
    end
  end

  def test_type
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end

  def test_kind
    value = 9
    assert_kind_of(Numeric, value)
  end

  def test_same
    list = List.new
    assert_same(list, list.process)
  end

  def test_refutations
    list = []
    refute_includes(list, 'xyz')
  end
end