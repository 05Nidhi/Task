# frozen_string_literal: true

require 'rubocop'
require 'csv'
require 'byebug'
require_relative 'sigin'
require_relative 'register'
# Code start here
class Bank
  include Sigin
  include Register
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
        register
        break
      when '2'
        sigin
        break
      when '3'
        break
      else
        puts 'Alert,enter correct option'
      end
    end
  end
end
obj = Bank.new
obj.details
