# frozen_string_literal: true

require 'csv'
require 'rubocop'
headers = %w[id name address]
print('enter your ID:')
a = gets.chomp.to_i
print('enter your name:')
b = gets.chomp
print('enter your Address:')
c = gets.chomp
if File.exist?('data.csv')
  CSV.open('data.csv', 'a+') do |csv|
    csv << headers if csv.count.eql? 0
    csv << [a, b, c]
  end
else
  File.new('data.csv', 'a+')
  CSV.open('data.csv', 'a+') do |csv|
    csv.puts headers if csv.count.eql? 0
    csv.puts [a, b, c]
  end
end
