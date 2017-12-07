require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
  include Attributes

  def initialize(url)
    surf_report = Nokogiri::HTML(open(url))

    self.condition = surf_report.css("div.day-slider-container div div strong").collect{|w| w.text}

    self.wave_height = surf_report.css("div.day-slider-container h1").collect{|h| h.text}

    data = surf_report.css("div.day-slider-container div div span").collect{|t| t.text}.delete_if{|k| k.include?("Kurt")}
    self.date = []
    self.date << data[0]
    self.date << data[3]
    self.date << data[6]

    self.wind = []
    self.wind << data[2]
    self.wind << data[5]
    self.wind << data[8]

    self.weather = []
    self.weather << data[9]
    self.weather << data[11]
    self.weather << data[13]

    self.weather_temp = []
    self.weather_temp << data[10].gsub(/\u00B0/, "")
    self.weather_temp << data[12].gsub(/\u00B0/, "")
    self.weather_temp << data[14].gsub(/\u00B0/, "")
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
