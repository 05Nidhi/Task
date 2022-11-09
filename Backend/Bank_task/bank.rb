# frozen_string_literal: true

require 'rubocop'
require 'csv'
require 'byebug'
require_relative 'sigin'
require_relative 'register'
# Code start here
class Bank
  # @amount = 0

  include Sigin
  include Register

  def details
    loop do
      puts '---------------Select your desired option----------------'
      puts '1.Register your account'
      puts '2. Sign_in '
      puts '3. Exit'
      print 'Enter your option: '
      option = gets.chomp
      choose(option)
      break
    end
  end

  def choose(option)
    case option
    when '1'
      register
    when '2'
      @amount = 0
      sigin
    else
      puts 'Exit'
      exit
    end
  end
end
obj = Bank.new
obj.details
