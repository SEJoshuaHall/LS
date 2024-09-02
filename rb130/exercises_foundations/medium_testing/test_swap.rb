require 'minitest/autorun'
require_relative 'swap.rb'
# require_relative 'swap.txt'

class Swap_Test < Minitest::Test
  
  def setup
    @file = File.open('swap.txt')
    @text = @file.read
    @test = Text.new(@text)
    @revised = "Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi."
  end

  def test_swap
    @test.swap('a', 'e')
    assert(@revised, @test.text)
  end

  def test_word_count
    assert 72, @test.word_count
  end

  def teardown
    @file.close
  end
end
