class Cart

  def initialize
    @cart = []
  end

  def add_product(product)
    @cart << product if product.amount > 0
  end

  def total
    total = 0
    @cart.each {|product| total += product.price}
    total
  end

  def status
    @cart
  end
end