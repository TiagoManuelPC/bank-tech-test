# frozen_string_literal: true

require 'statement'
require 'date'

describe Statement do
  let(:transaction1) { double :transaction1, date: Date.today, amount: 10, balance: 20, type: "Credit" }
  let(:transaction2) { double :transaction2, date: Date.today, amount: 10, balance: 20, type: "Debit" }
  let(:transactions_array1) { [transaction1] }
  let(:transactions_array2) { [transaction2] }
  describe '#print' do
    it 'prints a list of transactions when Credit added' do
      expect { Statement.print(transactions_array1) }.to output("date || credit || debit || balance\n#{Date.today.strftime("%m/%d/%Y")} || 10 || || 20\n").to_stdout
    end

    it 'prints a list of transactions when Debit deducted' do
        expect { Statement.print(transactions_array2) }.to output("date || credit || debit || balance\n#{Date.today.strftime("%m/%d/%Y")} ||     || 10 || 20\n").to_stdout
      end
  end
end
