class BankAccount
  MINIMUNBALLANCE = 0
  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise "Can't complete transaction: Insufficient Funds" if overdraft?(amount)
    @balance -= amount
  end

  private

  def overdraft?(amount)
    @balance - amount < MINIMUNBALLANCE
  end
end