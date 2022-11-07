# frozen_string_literal: true

require 'rubocop'
require 'csv'
require 'byebug'
# Code start here
class Bank # rubocop:disable Metrics/ClassLength
  @@headers = %w[Name Email passward amount]
  @@table = CSV.read('data.csv', headers: true)
  def details
    loop do
      puts '---------------Select your desired option----------------'
      puts '1.Register your account'
      puts '2. Sign_in '
      puts '3. Exit'
      print 'Enter your option: '
      a = gets.chomp
      case a
      when '1'
        puts 'Enter your details for registration-----'
        register
        break
      when '2'
        puts 'sign_in'
        sigin
      when '3'
        puts 'Exit'
        break
      else
        puts 'Alert,enter correct option'
      end
    end
  end

  def sigin
    print 'Enter Your registered Email id: '
    @@email1 = gets.chomp
    @@table.find do |row|
      if row['Email'] == @@email1
        print 'Enter yor passward: '
        pswrd = gets.chomp
        puts 'Sigin sucessfully'
        withdraw_deposite
        break
      end
    end
    puts 'Entered wrong mail..........'
    break
  end

  def register

    amount=0

    print 'Enter your name: '
    name = gets.chomp.to_s
    print 'Enter your Email: '
    email = gets.chomp.to_s
    if File.exist?('data.csv')
      @@table.find do |row|
        next unless row['Email'] == email

        puts 'Email already present'
        details
        break
      end
    end
    print 'Enter your passward: '
    passwrd = gets.chomp.to_s
    print 'Enter your Re-passward: '
    re_pswrd = gets.chomp.to_s
    if passwrd != re_pswrd
      puts 'Please enter match passward'
    else
      puts 'Register sucessfully'
    end
    if File.exist?('data.csv')
      CSV.open('data.csv', 'a+') do |csv|
        csv << @@headers if csv.count.eql? 0
        csv << [name, email, re_pswrd, amount.to_i]
      end
    else
      File.new('data.csv', 'a+')
      CSV.open('data.csv', 'a+') do |csv|
        csv.puts @@headers if csv.count.eql? 0
        csv.puts [name, email, re_pswrd, amount.to_i]
      end
    end
  end

  def withdraw_deposite # rubocop:disable Metrics/MethodLength
    while 2 < 4
      puts '---------------Select your desired option----------------'
      puts ' 1. Withdraw'
      puts ' 2. Deposite'
      puts ' 3. Check balance'
      puts ' 4. Exit'
      print ' Enter your option: '
      option = gets.chomp

      case option
      when '1'
        print 'Enter your Withdrawal ammount: '
        withdraw = gets.chomp.to_i
        withdraw(withdraw)
      when '2'
        print 'Enter amount you want to Deposite: '
        deposite = gets.chomp.to_i
        deposite(deposite)
      when '3'
        @@table.find do |row|
          if row['Email'] == @@email1
            puts "Amount in your account is : #{row['amount']}"
            break
          end
        end
        withdraw_deposite
      when '4'
        puts 'Exit'
        break
      else
        puts 'Alert,enter correct option'
      end
    end
  end

  def withdraw(withdraw)
    a=File.open('data.csv', 'a+')

    CSV.open('data.csv', 'a+') do |csv|
      @@table.find do |row|
        if row['Email'] == @@email1
          row['amount']=row['amount'].to_i-withdraw
          puts "your left over amount: #{row['amount']}"
          csv<<row
        end
      end
    end
  end



    # table = CSV.parse("data.csv", headers: true)



  def deposite(deposite)
    # byebug
    a=File.open('data.csv', 'a+')

    CSV.open('data.csv', 'a+') do |csv|
      # byebug
      @@table.find do |row|
        byebug
        if row['Email'] == @@email1
          # byebug
          # row['amount']=row['amount'].to_i
          # row<<row['amount'].to_i+withdraw
          row['amount']=row['amount'].to_i+deposite

          # has=row.to_h
          # hashes['amount']
          # hashes
          # row<<[row['Name'],row['Email'],row['passward'],a]
          csv<<row
          # a.close()
        end
        # byebug
        # row<<[row['Name'],row['Email'],row['passward'],a]
      end
    end

    # puts "Amount in your account is #{deposite}"
  end
end
obj = Bank.new
obj.details
