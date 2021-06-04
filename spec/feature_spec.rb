require 'bank_account'

describe 'feature test' do
  subject { BankAccount.new }
  
  it 'returns correct statement 3 transactions' do
    subject.deposit(500)
    subject.deposit(500)
    subject.withdraw(100)
    expect{subject.print_statement}.to output("date || credit || debit || balance\n#{Date.today.strftime('%m/%d/%Y')} || 500.00 || || 500.00\n#{Date.today.strftime('%m/%d/%Y')} || 500.00 || || 1000.00\n#{Date.today.strftime('%m/%d/%Y')} || || 100.00 || 900.00\n").to_stdout
  end
  it 'returns correct statement for 1' do
    subject.deposit(500)
    
    expect{subject.print_statement}.to output("date || credit || debit || balance\n#{Date.today.strftime('%m/%d/%Y')} || 500.00 || || 500.00\n").to_stdout
  end

  it 'returns correct statement for 2 transactions' do
    subject.deposit(500)
    subject.deposit(500)
    expect{subject.print_statement}.to output("date || credit || debit || balance\n#{Date.today.strftime('%m/%d/%Y')} || 500.00 || || 500.00\n#{Date.today.strftime('%m/%d/%Y')} || 500.00 || || 1000.00\n").to_stdout
  end
  
  it 'returns correct statement for 0' do 
    expect{subject.print_statement}.to output("date || credit || debit || balance\n").to_stdout
  end
end
