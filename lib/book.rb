class Book < Product

  def self.from_file
    file_books = Dir[File.join(__dir__, "../data/books", "*.txt")]

    film_info =
      file_books.map do |file|
        lines = File.readlines(file, chomp: true)
        self.new(
          title:  lines[0],
          genre:  lines[1],
          author: lines[2],
          price:  lines[3].to_i,
          amount: lines[4].to_i
        )
      end
  end

  attr_accessor :title, :author, :genre

  def initialize(params)
    super
    @title = params[:title]
    @author = params[:author]
    @genre = params[:genre]
  end

  def to_s
    return "Книга #{@title}, #{@genre}, автор - #{@author} " + super
  end

  def update(params)
    super
    @title = params[:price] if params[:title]
    @author = params[:title] if params[:author]
    @genre = params[:genre] if params[:genre]
  end
end
