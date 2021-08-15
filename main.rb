require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'

film = Film.from_file
book = Book.from_file

range = film + book
puts "Наш ассортимент:"

range.each { |item| puts"#{item}" }



