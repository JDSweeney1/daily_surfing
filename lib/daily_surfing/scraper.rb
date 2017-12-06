class Scraper
  include Attributes

  def initialize(url)
    #fake surf_data
    #open html and nokogiri go here
    @name = "broward_miami_dade"
    @date = "12/05"
    @condition = "fair"
    @wave_height = "2-3ft"
    @wind = "LP LP LP"
    @weather = "Tornado"
  end

  def self.broward_miami_dade
    #I want this to scrape one of four pages, each used for a different region.
    scraper = self.new("url")
    Surf_Data.new(scraper.name, scraper.date, scraper.condition, scraper.wave_height, scraper.wind, scraper.weather)

  end

  def self.palm_beach
    #I want this to scrape one of four pages, each used for a different region.
    scraper = self.new("url")
    Surf_Data.new(scraper.name, scraper.date, scraper.condition, scraper.wave_height, scraper.wind, scraper.weather)

  end

  def self.cental_florida
    #I want this to scrape one of four pages, each used for a different region.
    scraper = self.new("url")
    Surf_Data.new(scraper.name, scraper.date, scraper.condition, scraper.wave_height, scraper.wind, scraper.weather)

  end

  def self.north_florida
    #I want this to scrape one of four pages, each used for a different region.
    scraper = self.new("url")
    Surf_Data.new(scraper.name, scraper.date, scraper.condition, scraper.wave_height, scraper.wind, scraper.weather)

  end
end
