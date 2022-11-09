# frozen_string_literal: true

# Code start here
module Sigin
  # @amount = 0
  def sigin
    @table = CSV.read('data.csv', headers: true)
    print 'Enter Your registered Email id: '
    @email1 = gets.chomp
    mail_check
    puts 'Entered mail is not registered..........'
  end

  def mail_check
    data = CSV.read('data.csv', headers: true)
    data.find do |row|
      next unless row['Email'] == @email1

      print 'Enter your passward: '
      pswrd = gets.chomp
      withdraw_deposite(pswrd)
      exit
    end
  end

  def withdraw_deposite(*)
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
    when '1' then withdraw
    when '2' then deposite
    when '3'
      amountt
    when '4'
      exit
    else
      puts 'entered wrong option----------------'
    end
  end

  def withdraw
    print 'Enter your Withdrawal ammount: '
    b = gets.chomp.to_i
    if @amount < b
      puts "!!!!!you didn't have sufficient amount!!!!!"
    elsif b.negative?
      puts '!!!!!!Please enter valid amount!!!!!!'
    else
      @amount -= b
    end
  end

  def deposite
    print 'Enter amount you want to Deposite: '
    a = gets.chomp.to_i
    if a.negative?
      puts '!!!!!Please enter valid amount!!!!!!'
    else
      @amount += a
    end
  end

  def amountt
    puts "your balance: #{@amount}"
  end
end
