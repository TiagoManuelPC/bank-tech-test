class Statement
    def self.print(transactions)
      puts 'date || credit || debit || balance'
      transactions.each do |transaction|
        if is_credit?(transaction)
          puts "#{transaction.date} || #{transaction.amount} || || #{transaction.balance}"
        else
          puts "#{transaction.date} ||     || #{transaction.amount} || #{transaction.balance}"
        end
      end
    end
  
    private
  
    def self.is_credit?(transaction)
      true if transaction.type == "Credit"
    end
  end