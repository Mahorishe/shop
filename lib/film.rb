class Film < Product

  def self.from_file
    file_films = Dir[File.join(__dir__, "../data/films", "*.txt")]

    film_info =
      file_films.map do |file|
        lines = File.readlines(file, chomp: true)
        self.new(
          title:    lines[0],
          producer: lines[1],
          year:     lines[2].to_i,
          price:    lines[3].to_i,
          amount:   lines[4].to_i
        )
      end
  end

  attr_accessor :title, :producer, :year

  def initialize(params)
    super
    @title = params[:title]
    @producer = params[:producer]
    @year = params[:year]
  end

  def to_s
    return "Фильм #{@title}, #{@year}, реж. #{@producer} " + super
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @producer = params[:producer] if params[:producer]
    @year = params[:year] if params[:year]
  end
end
