class ProductCollection

  attr_reader :products

  PRODUCTS_TYPES = {
    film: {class: Film},
    book: {class: Book},
    disk: {class: Disk}
  }

  def initialize(products = [])
    @products = products
  end

  def self.from_self

    products = []

    PRODUCTS_TYPES.each do |type, hash|

        product_class = hash[:class]

        products_time = product_class.from_file
        products_time.each do |product|
          products << product
        end
    end
    self.new(products)
  end

  def to_a
    @products
  end

  def sort!(params)

    @products
    case params[:by]
      when :title then @products.sort_by! {|product| product.to_s}
      when :price then @products.sort_by! {|product| product.price}
      when :amount then @products.sort_by! {|product| product.amount}
    end
      @products.reverse! if params[:order] == :asc
      self
  end
end