class Disk < Product

  def self.from_file
    file_films = Dir[File.join(__dir__, "../data/disks", "*.txt")]

    film_info =
      file_films.map do |file|
        lines = File.readlines(file, chomp: true)
        self.new(
          album_title: lines[0],
          author: lines[1],
          genre: lines[2],
          release_year: lines[3].to_s,
          price: lines[4].to_i,
          amount: lines[5].to_i
        )
      end
  end

  attr_accessor :album_title, :author, :genre, :release_year

  def initialize(params)
    super
    @album_title = params[:album_title]
    @author = params[:author]
    @genre = params[:genre]
    @release_year = params[:release_year]
  end

  def to_s
    return "Альбом #{@author}, #{@album_title},#{@genre} " + super
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @producer = params[:producer] if params[:producer]
    @year = params[:year] if params[:year]
  end
end