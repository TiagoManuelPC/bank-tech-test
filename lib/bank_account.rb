require_relative 'transaction'
require_relative 'statement'

class BankAccount
  attr_reader :balance, :transactions
   
  MINIMUNBALLANCE = 0
  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    create_transaction(amount,"Credit")
  end

  def withdraw(amount)
    raise "Can't complete transaction: Insufficient Funds" if overdraft?(amount)
    @balance -= amount
    create_transaction(amount, "Debit")
  end

  def print_statement(statement = Statement)
    statement.print(@transactions)
  end

  private
  def create_transaction( amount, type , transaction = Transaction)
    @transactions << transaction.create(amount,type, @balance)
  end

  def overdraft?(amount)
    @balance - amount < MINIMUNBALLANCE
  end
end