

class Cli

  @@class = []

  def initialize
    @@class << Scraper.new
    @@class << Surf_Data.new("hello")
    #@@class << self
    puts "#{@@class}"
    #testing


  end
end
