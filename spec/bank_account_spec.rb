# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  subject(:new_account) { described_class.new }
  let(:statement) { double :statement }
  let(:transaction) {double :transaction}

  it 'can create a new account' do
    expect(new_account).to be_an_instance_of(BankAccount)
  end

  it 'starts with a balance of zero' do
    expect(new_account.balance).to be_equal(0)
  end

  context '#has transactions that' do
    before do
      new_account.deposit(500)
    end

    it 'allow deposits' do
      new_account.deposit(500)
      expect(new_account.balance).to be_equal(1000)
    end

    it 'allow to withdraw money' do
      new_account.withdraw(500)
      expect(new_account.balance).to be_equal(0)
    end

    it 'doesnt put the account in overdraft' do
      expect { new_account.withdraw(1000) }.to raise_error("Can't complete transaction: Insufficient Funds")
    end
  end

  context 'stores transactions data' do
    it 'starts with no transactions' do
      expect(new_account.transactions).to be_empty
    end
    it ' has data after a transaction is done' do
      new_account.deposit(500)
      expect(new_account.transactions).not_to be_empty
    end
  end

  describe '#print_statement' do
    it 'delagates to the Statement object' do
      expect(statement).to receive(:print)
      statement.print() 
    end
  end
end
