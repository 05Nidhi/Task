# frozen_string_literal: true

# Code start here
module Register
  def register
    puts 'Enter your details for registration-----'
    headers = %w[Name Email passward amount]
    table = CSV.read('data.csv', headers: true)
    print 'Enter your name: '
    name = gets.chomp.to_s
    print 'Enter your Email: '
    email = gets.chomp.to_s
    if File.exist?('data.csv')
      table.find do |row|
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
    CSV.open('data.csv', 'a+') do |csv|
      csv << headers if csv.count.eql? 0
      csv << [name, email, re_pswrd, 0]
    end
  end
end
