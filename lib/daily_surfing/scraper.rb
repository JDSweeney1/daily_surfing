class Scraper

  def initialize(url)
  end

  def self.broward_miami_dade
    #I want this to scrape one of four pages, each used for a different region.
    #fake surf_data
    #open html and nokogiri go here
    self.new("url")

    name = "broward_miami_dade"
    date = "12/05"
    condition = "fair"
    wave_height = "2-3ft"
    wind = "LP LP LP"
    weather = "Tornado"

    Surf_Data.new(name, date, condition, wave_height, wind, weather)

  end
end
