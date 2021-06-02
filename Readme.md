# Bank Challenge Week 10 #

* Working solo to solve a technical problem and write clean code
* In this challenge I approached it with a TDD process in order to complete the user stories.

## How to use 

After cloning this project, navigate to the project's directory.
Once you're there run `bundle install` to install the necessary gems.

``` 
$ git clone https://github.com/TiagoManuelPC/bank-tech-test.git
$ cd bank-tech-test
$ bundle install
```

Next you will need to start IRB and require the `BankAccount.rb` file.

```
$ irb
> require './lib/bank_account.rb'
```

Now we will want to make instantiate a bank account 

``` 
> new_account = BankAccount.new
```

Once you have a bank account, feel free to deposit and withdraw! Both deposit and withdraw take an integer as an argument.

```
> new_account.deposit(100)
> new_account.withdraw(50)
```
you can withdraw funds until your account hits zero! you cant go on overdraft! 

When you're ready to see how much you spent print your statement.

```
> new_account.print_statement
```

## For testing ##
I used Rspec

Simply run

```
> rspec
```




## User Stories ##



```
As a client
So I can have a bank account
I would like to open a new account

As a client
So I can store my money
I would like to be able to make a deposit

As a client
So I can retrieve my money
I would like to be able to make a withdraw

As a client
So I will not be in negative
I would like the minimum limit in my account to be zero

As a client
So I can manage my money
I would like to see my balance

As a client
So I can manage my finances
I would like to be able to view a bank statement

```

## Live Demo
![Home](./public/Bank.gif)

