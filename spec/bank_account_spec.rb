require 'bank_account'

describe BankAccount do
  subject(:tiago) {described_class.new}
  
  it 'can create a new account' do
    expect(tiago).to be_an_instance_of(BankAccount)
  end

  it 'starts with a balance of zero' do
    expect(tiago.balance).to be_equal(0)
  end
  
  context '#has transactions that' do
    before do 
      tiago.deposit(500)
    end

    it 'allow deposits' do
      tiago.deposit(500)
      expect(tiago.balance).to be_equal(1000)
    end

    it 'allow to withdraw money' do
      tiago.withdraw(500)
      expect(tiago.balance).to be_equal(0)
    end

    it 'doesnt put the account in overdraft' do
      expect{tiago.withdraw(1000)}.to raise_error("Can't complete transaction: Insufficient Funds")
    end
  end
end