
#lib_dir =  File.expand_path(__dir__, '../lib')
require 'pry'
require 'pathname'


require_relative '../lib/command_line.rb'
require_relative '../lib/address_book.rb'
require_relative '../lib/contact.rb'
require_relative '../lib/test.rb'

# # require '../spec/_test.rb'

# # attributes = {:name => "name", :surname => "surname", :email => "email"}
# # c = Contact.new attributes
# # puts c.[] attributes[:name]

t = Test.new

address_book = AddressBook.new("address_book.txt")
address_book.load
# contacts =address_book.contacts
# puts contacts.size
# #address_book.save
# index = 1
# puts address_book.contacts.at(index)
#puts "#{address_book.contacts.at(index).name}"
cli = AddressBookCommandLine.new(address_book)
cli.start