require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(1000.0)
    transaction = Transaction.new(100.0)
    transaction.amount_paid = 100.0
    register.accept_money(transaction)
    assert_equal(1100.0, register.total_money)
  end

  def test_change
    register = CashRegister.new(1000.0)
    transaction = Transaction.new(100.0)
    transaction.amount_paid = 200.0

    assert_equal(100.0, register.change(transaction))
  end

  def test_receipt
    register = CashRegister.new(1000.0)
    transaction = Transaction.new(100.0)
    transaction.amount_paid = 200.0
    output = capture_io do
      register.give_receipt(transaction)
    end
    p output

    assert_equal("You've paid $100.0.\n", output[0])
  end

end