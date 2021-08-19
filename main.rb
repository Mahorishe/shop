require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'
require_relative 'lib/disk'
require_relative 'lib/product_collection'
require_relative 'lib/cart'

collection = ProductCollection.from_self

cart = Cart.new

collection.sort!(by: :price, order: :asc)

user_choice = 1

while user_choice >= 0 do
  puts "Выберете товары для покупки"
  puts
  collection.to_a.each.with_index(1) do |product, index|
    puts "#{index}. #{product}"
  end
  puts "0. Выход"
  user_choice = STDIN.gets.to_i - 1
  break if user_choice < 0

  current_product = collection.products[user_choice]
  cart.add_product(current_product)
  current_product.update(amount: current_product.amount - 1) if current_product.amount > 0
  if current_product.amount.zero?
    puts "Товар закончился, выберете, что-то другое"
  end

  puts <<~CARD
  Вы выбрали #{current_product}
  Всего товаров на сумму: #{cart.total}
  CARD
end

puts "Вы купили:"
puts cart.status
puts "С Вас: #{cart.total}"





