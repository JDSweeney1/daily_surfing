class DailySurfing::Cli

  @@class = []

  def initialize
    @@class << DailySurfing::Scraper.new
    @@class << DailySurfing::Surf_Data.new("hello")
    #@@class << self
    puts "#{@@class}"
    #testing


  end
end
