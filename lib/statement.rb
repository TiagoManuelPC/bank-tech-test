# frozen_string_literal: true

# Set up for printing transactions
class Statement
  def self.print(transactions)
    puts 'date || credit || debit || balance'
    transactions.each do |transaction|
      if credit?(transaction)
        puts "#{transaction.date.strftime("%m/%d/%Y")} || #{transaction.amount} || || #{transaction.balance}"
      else
        puts "#{transaction.date.strftime("%m/%d/%Y")} ||     || #{transaction.amount} || #{transaction.balance}"
      end
    end
  end

  def self.credit?(transaction)
    true if transaction.type == 'Credit'
  end
end
