# frozen_string_literal: true

# Code start here
module Sigin
  # @amount = 0
  def sigin
    @table = CSV.read('data.csv', headers: true)
    print 'Enter Your registered Email id: '
    @email1 = gets.chomp
    mail_check
    puts 'Entered wrong mail..........'
  end

  def mail_check
    @table.find do |row|
      next if row['Email'] == @email1

      print 'Enter yor passward: '
      pswrd = gets.chomp
      passward_validation(pswrd)
    end
  end

  def passward_validation(pswrd)
    @table.find do |row|
      if row['passward'] == pswrd
        withdraw_deposite
        # break
      else
        puts 'wrong passward'
      end
    end
  end

  def withdraw_deposite
    while 2 < 4
      puts '---------------Select your desired option----------------'
      puts ' 1. Withdraw'
      puts ' 2. Deposite'
      puts ' 3. Check balance'
      puts ' 4. Exit'
      print ' Enter your option: '
      input_option
      # exit
    end
  end

  def input_option
    opt = gets.chomp
    option(opt)
  end

  def option(opt)
    case opt
    when '1'
      withdraw
    when '2'
      deposite
    when '3'
      amountt
    else
      exit
    end
  end

  def withdraw
    print 'Enter your Withdrawal ammount: '
    b = gets.chomp.to_i
    if @amount < b
      puts "!!!!!you didn't have sufficient amount!!!!!"
    else
      @amount -= b
    end
  end

  def deposite
    print 'Enter amount you want to Deposite: '
    a = gets.chomp.to_i

    @amount += a
  end

  def amountt
    puts "your balance: #{@amount}"
  end
end
