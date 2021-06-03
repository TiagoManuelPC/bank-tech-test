# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'
# Responsable for Managing the account
class BankAccount
  attr_reader :balance, :transactions

  MINIMUN_BALLANCE = 0
  def initialize(statement = StatementPrinter)
    @balance = 0
    @transactions = []
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    create_transaction(amount, 'Credit')
  end

  def withdraw(amount)
    raise "Can't complete transaction: Insufficient Funds" if overdraft?(amount)

    @balance -= amount
    create_transaction(amount, 'Debit')
  end

  def print_statement
    @statement.print(@transactions)
  end

  private

  def create_transaction(amount, type, transaction = Transaction)
    @transactions << transaction.create(amount, type, @balance)
  end

  def overdraft?(amount)
    @balance - amount < MINIMUN_BALLANCE
  end
end
