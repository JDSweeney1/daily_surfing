require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
  include Attributes

  def initialize(url)
    #html = File.read("url")
    surf_report = Nokogiri::HTML(open(url))
    binding.pry
    #fake surf_data
    #date: surf_report.css("div.day-slider-container div div span").first.text
    data = surf_report.css("div.day-slider-container div div span").collect{|t| t.text}.delete_if{|k| k.include?("Kurt")}
    #data[0] = first day  data[1] = brief description data[2] = wind description
    #data[3] = second day data[4] = brief description data[5] = wind description
    #data[6] = third day  data[7] = brief description data[8] = wind description
    #data[9] = first day weather data[10].gesub('\u00B0', "") = first day temp

    #weather = surf_report.css("div.day-slider-container div div strong").collect{|w| w.text}
    #weather[0] = day 1 weather[1] = day 2 weather [2] = day 3

=begin
    ["Wednesday - 12/06",
 "ankle to knee high",
 "Small SE windswell with SE winds.  ",
 "Thursday - 12/07",
 "Flat",
 "Minimal windswell traces. Light winds.  ",
 "Friday - 12/08",
 "Flat",
 "Minimal traces. Light winds.  ",
 "scattered showers",
 "71-83\u00B0 F",
 "sunny",
 "70-83\u00B0 F",
 "scattered showers",
 "71-82\u00B0 F"]
=end
    @name = "broward_miami_dade"
    @date = data[0]
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
