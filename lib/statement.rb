# frozen_string_literal: true

# Set up for printing transactions
class StatementPrinter
  def self.print(transactions)
    puts 'date || credit || debit || balance'
    transactions.each do |transaction|
      if credit?(transaction)
        puts "#{transaction.date.strftime("%m/%d/%Y")} || #{'%.2f' % transaction.amount} || || #{'%.2f' % transaction.balance}"
      else
        puts "#{transaction.date.strftime("%m/%d/%Y")} || || #{'%.2f' % transaction.amount} || #{'%.2f' % transaction.balance}"
      end
    end
  end

  def self.credit?(transaction)
   transaction.type == 'Credit'
  end
end
