require 'minitest/autorun'
require_relative 'swap.rb'
require_relative 'swap.txt'

class Swap_Test < Minitest::Test

  def setup
    @test = Text.new(File.open(@file, 'r'))
    @revised = "Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi."
  end

  def test_swap
    @text.swap('a', 'e')
    assert(@revised, @text.text)
  end

  def teardown
    @test.text.close
  end
end
