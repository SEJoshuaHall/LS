require 'minitest/autorun'
require_relative 'swap.rb'

class TestSwap < Minitest::Test
  def setup
    @doc = File.open("swap.txt", 'r')
  end

  def test_swap
    text = Text.new(@doc.read)
    actual_text = text.swap('a', 'e')
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT
    assert_equal(expected_text, actual_text)
  end

  def teardown
    @doc.close
  end
end