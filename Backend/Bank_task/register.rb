# frozen_string_literal: true

# Code start here
module Register
  def register
    puts 'Enter your details for registration-----'
    print 'Enter your name: '
    @name = gets.chomp.to_s
    input
    if @passwrd != @re_pswrd
      puts 'Please enter match passward'
    else
      puts 'Register sucessfully'
    end
    input_csv
  end

  def input_csv
    headers = %w[Name Email passward amount]
    CSV.open('data.csv', 'a+') do |csv|
      csv << headers if csv.count.eql? 0
      csv << [@name, @email, @re_pswrd, 0]
    end
  end

  def input
    print 'Enter your Email: '
    @email = gets.chomp.to_s
    print 'Enter your passward: '
    @passwrd = gets.chomp.to_s
    print 'Enter your Re-passward: '
    @re_pswrd = gets.chomp.to_s
  end

  def email_exist
    table = CSV.read('data.csv', headers: true)
    table.find do |row|
      next unless row['Email'] == email

      puts 'Email already present'
      details
      break
    end
  end
end
