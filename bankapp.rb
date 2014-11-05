class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
      @name = name
      @balance = balance
  end
  
  public
  
  def display_balance(pin_number)
    if pin_number == pin
      puts "Balance: $#{@balance}" 
    else
      puts pin_error
    end
  end
  
  def withdraw(pin_number, amount)
    if pin_number == pin
      if amount > @balance
      puts "Not enough funds in account. Transaction cancelled. $3 Bank fee assessed."  
      @balance -= 3
      else
      @balance = @balance - amount
      puts "Withdrew $#{amount}. New blalance: $#{@balance}"
      end
    else
      puts pin_error
    end
  end
  
  def deposit(pin_number, amount)
      if pin_number == pin
        @balance += amount
        puts "Added $#{amount} funds to account. New balance: $#{@balance}."
      else
        puts pin_error
      end
  end
  
  private
  
  def pin
    @pin = 1234
  end
  
  def pin_error
    "Access denied: incorrect PIN."
  end
      
end

class CheckingAccount < Account
    def order_cheques
      puts "Checks mailed to #{@name}"
      @balance -= 4
    end
end

class SavingsAccount < Account
end

checking_account = CheckingAccount.new("Gordie", 1000)
puts "Created a checking account for #{checking_account.name}"
checking_account.withdraw(1234, 50)
checking_account.display_balance(1234)
checking_account.withdraw(1234, 2000)
checking_account.deposit(1234, 100)
checking_account.display_balance(1234)
checking_account.order_cheques
checking_account.display_balance(1234)