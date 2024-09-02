require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'
require 'stringio'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
  end
  
  # def test_accept_money
  #   @transaction = Transaction.new(100)
  #   @transaction.amount_paid = 50
  #   start_amount = @register.total_money
  #   @register.accept_money(@transaction)
  #   end_amount = @register.total_money
  #   assert_equal (start_amount + @transaction.amount_paid), end_amount
  # end

  # def test_change
  #   @transaction = Transaction.new(100)
  #   @transaction.amount_paid = 50
  #   assert_equal -50, @register.change(@transaction)
  # end

  # def test_give_receipt
  #   @transaction = Transaction.new(100)
  #   @transaction.amount_paid = 50
  #   assert_output(stdout = "You've paid $100.\n") {@register.give_receipt(@transaction)}
  # end

  def test_prompt_for_payment
    @transaction = Transaction.new(100)
    input = StringIO.new("100\n")
    io = StringIO.new("")
    $stdout = io
    @transaction.prompt_for_payment(input: input)
    assert_equal 100, @transaction.amount_paid
    $stdout = STDOUT
  end
end