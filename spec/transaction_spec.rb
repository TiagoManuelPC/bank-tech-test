require 'transaction'
require 'date'
require 'bank_account'

describe Transaction do
    let(:tiago) {BankAccount.new}
    subject(:transaction) {described_class.new( 100, 'Credit' ,tiago.balance)}
    
    
    it 'has a date' do
      expect(transaction.date).to eq(Date.today)
    end

    it 'has a balance' do
      tiago.deposit(100)
      expect(tiago.balance).to eq(100)
    end

    it 'has a type' do
      expect(transaction.type).to eq('Credit')
    end

    it 'has an amount' do
      expect(transaction.amount).to eq(100)
    end

  
end