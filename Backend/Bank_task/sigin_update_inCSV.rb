# frozen_string_literal: true

# Code start here
module Sigin
  def sigin
    @@table = CSV.read('data.csv', headers: true)
    print 'Enter Your registered Email id: '
    @@email1 = gets.chomp
    @@table.find do |row|
      # byebug
      CSV.open('data.csv', 'a+') do |csv|
        if row['Email'] == @@email1
          print 'Enter yor passward: '
          pswrd = gets.chomp
          withdraw_deposite
          break
        end
      end
    end
    puts 'Entered wrong mail..........'
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
        @@table.find do |row|
          CSV.open('data.csv', 'a+') do |csv|
            # byebug
            if row['Email'] == @@email1 && row['amount'].to_i < withdraw
              # byebug
              puts 'you dont have sufficient data-----------'
            end
          end
        end

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
      when '4'
        puts 'Exit'
        break
      else
        puts 'Alert, Enter correct option'
      end
    end
  end

  def withdraw(withdraw)
    CSV.open('data.csv', 'a+') do |csv|
      @@table.find do |row|
        if row['Email'] == @@email1
          row['amount'] = row['amount'].to_i - withdraw
          puts "your left over amount: #{row['amount']}"
          csv << row
        end
      end
    end
  end

  def deposite(deposite)
    CSV.open('data.csv', 'a+') do |csv|
      @@table.find do |row|
        if row['Email'] == @@email1
          row['amount'] = row['amount'].to_i + deposite
          csv << row
        end
      end
    end
  end
end
