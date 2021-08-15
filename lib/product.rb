class Product

  def self.from_file(file_path)
    NotImplementedError
  end

  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def to_s
    return "#{@price} руб. (осталось: #{@amount})"
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end
end