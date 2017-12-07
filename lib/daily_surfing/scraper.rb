class Scraper
  include Attributes

  def initialize(url)
    surf_report = Nokogiri::HTML(open(url))

    self.condition = surf_report.css("div.day-slider-container div div strong").collect{|w| w.text}
    self.wave_height = surf_report.css("div.day-slider-container h1").collect{|h| h.text}
    # All information in the data array use "span" with no identifying attributes, therefore array indecies were used to sort them out.
    data = surf_report.css("div.day-slider-container div div span").collect{|t| t.text}.delete_if{|k| k.include?("Kurt")}
    self.date = [data[0], data[3], data[6]]
    self.wind = [data[2], data[5], data[8]]
    self.weather = [data[9], data[11], data[13]]
    self.weather_temp = [
                         data[10].gsub(/\u00B0/, ""),
                         data[12].gsub(/\u00B0/, ""),
                         data[14].gsub(/\u00B0/, "")
                       ]
  end

  def self.broward_miami_dade
    scraper = self.new("http://www.surfline.com/surf-forecasts/florida/broward---miami-dade_121124/")
    Surf_Data.new("Broward/Miami/Dade", scraper.date, scraper.condition, scraper.wave_height, scraper.wind, scraper.weather, scraper.weather_temp)
  end

  def self.palm_beach
    scraper = self.new("http://www.surfline.com/surf-forecasts/florida/treasure-coast---palm-beach_2155/")
    Surf_Data.new("Palm Beach", scraper.date, scraper.condition, scraper.wave_height, scraper.wind, scraper.weather, scraper.weather_temp)
  end

  def self.cental_florida
    scraper = self.new("http://www.surfline.com/surf-forecasts/florida/central-florida_2154/")
    Surf_Data.new("Central Florida", scraper.date, scraper.condition, scraper.wave_height, scraper.wind, scraper.weather, scraper.weather_temp)
  end

  def self.north_florida
    scraper = self.new("http://www.surfline.com/surf-forecasts/florida/north-florida_2153/")
    Surf_Data.new("North Florida", scraper.date, scraper.condition, scraper.wave_height, scraper.wind, scraper.weather, scraper.weather_temp)
  end
end
