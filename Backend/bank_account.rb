# frozen_string_literal: true

require 'rubocop'
require 'csv'
class Bank

  def Details
    while true
      puts '---------------Select your desired option----------------'
      puts '1.Register your account'
      puts '2. Sign_in '
      puts '3. Exit'
      print 'Enter your option: '
      a = gets.chomp
      case a
      when '1'
        puts'Enter your details for registration-----'
        register
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
    @@email = gets.chomp
    print"Enter yor passward: "
    @@pswrd = gets.chomp
    table=CSV.read('data.csv', headers: true)
    duplicate=table.find {|row|
      if row['Email'] == @@email && row['passward'] == @@pswrd
        puts"Sigin sucessfully"
        withdraw_deposite
      end
    }
    puts "Enter wrong details"
  end
  def register
    headers = %w[Name Email passward amount]
    print"Enter your name: "
    name=gets.chomp.to_s
    print"Enter your Email: "
    email=gets.chomp.to_s
    if File.exist?('data.csv')
      table=CSV.read('data.csv', headers: true)
      duplicate=table.find {|row|
        if row['Email'] == email
          puts"Email already present"
          Details()
          break
        end
      }
    end
    print"Enter your passward: "
    pswrd=gets.chomp.to_s
    print"Enter your Re-passward: "
    re_pswrd=gets.chomp.to_s
    if pswrd! == re_pswrd
      puts"Please enter match passward"
    else
      puts"Register sucessfully"
    end
    if File.exist?('data.csv')
        CSV.open('data.csv', 'a+') do |csv|
        csv << headers if csv.count.eql? 0
        csv << [name,email,re_pswrd,0]
      end
    else
        File.new('data.csv', 'a+')
        CSV.open('data.csv', 'a+') do |csv|
        csv.puts headers if csv.count.eql? 0
        csv.puts [name,email,re_pswrd,0]
      end
    end
end
  def withdraw_deposite
    while true
      puts '---------------Select your desired option----------------'
      puts"1. Withdraw"
      puts"2. Deposite"
      puts"3. Check balance"
      puts"4. Exit"
      print"Enter your option: "
      option = gets.chomp
      table = CSV.read('data.csv', headers: true)
      arr = table.find {|row| row['Email'] == @@email}
      arr[3] = arr[3].to_i
      case option
      when '1'
        print 'Enter your Withdrawal ammount: '
        withdraw = gets.chomp.to_i
        if arr[3] < withdraw
          puts "Sorry,you don't have this much money in your account"
        else
          arr[3] = arr[3]-withdraw
          puts arr[3]
          puts "Leftover amount in your account #{arr[3]}"
          break
        end
      when '2'
        print 'Enter amount you want to Deposite: '
        deposite = gets.chomp.to_i
        arr[3] = arr[3]+deposite
        puts 'Amount in your account is #{deposite}'
        break
      when '3'
        puts 'Amount in your account is : #{arr[3]}'
        break
      when '4'
        puts 'Exit'
        break
      else
        puts 'Alert,enter correct option'
      end
    end
 end
end
obj = Bank.new
obj.Details()
