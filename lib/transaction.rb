# frozen_string_literal: true

require 'date'
require_relative 'bank_account'

# Setup to save transactions in the BankAccount
class Transaction
  attr_reader :date, :balance, :amount, :type

  def initialize(amount, type, balance)
    @date = Date.today
    @balance = balance
    @type = type
    @amount = amount
  end

  def self.create(amount, type, balance)
    Transaction.new(amount, type, balance)
  end
end
